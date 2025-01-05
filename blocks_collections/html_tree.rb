require_relative "tag"

class HtmlTree

	include Enumerable

	# private_class_method :new
	attr_accessor :root #корень дерева

	def initialize(root)
		@root = root
	end

	def self.from_html(html)
	    # Регулярное выражение для открывающих и закрывающих тегов
	    open_and_close_tags = /<(\w+)(\s+[^>]*)?>|<\/(\w+)>|([^<>]+)|<(\w+)\s*(\s+[^>]*)?\/>/
	    
	    #получим массив массивов, где каждый внутренний массив содержит части соответствующего тега
	    tags = html.scan(open_and_close_tags).map do |arr|
	    	hash = {}
	    	hash[:open_tag] = arr[0] if arr[0]    			# Открывающий тег
	    	hash[:props] = arr[1] if arr[1]       			# Атрибуты открывающего тега
	    	hash[:close_tag] = arr[2] if arr[2]   			# Закрывающий тег
			hash[:text_node] = arr[3] if arr[3]        	# Текстовый узел
		    hash[:self_closing_tag] = arr[4] if arr[4]  # Самозакрывающийся тег
		    hash[:props_closing] = arr[5] if arr[5] # Атрибуты самозакрывающегося тега
	    	hash
	    end
	    
	    root_el = tags.shift  # Получаем первый элемент — это корень
	    current_tag = Tag.create_tag(root_el[:open_tag], parse_attributes(root_el[:props]))  # Создаем корневой элемент
	    
	    root = current_tag  # Сохраняем корневой элемент для возвращения
	    
	    tags.each do |tag|
	    	if tag[:open_tag]
	        	# Создаем новый тег для открывающего тега
	        	new_tag = Tag.create_tag(tag[:open_tag], parse_attributes(tag[:props]))
	        	current_tag.add_child(new_tag)
	        	#Перемещаемся на тег ребенка
	        	current_tag = new_tag 
	    	elsif tag[:close_tag]
	        	# Возвращаемся к родительскому тегу при закрывающем теге
	        	current_tag = current_tag.parent
		 	elsif tag[:text_node]
	        	# Добавляем текстовый узел в текущий тег
	        	text_node = Tag.create_text_node(tag[:text_node].strip)
	        	current_tag.add_child(text_node) unless tag[:text_node].strip.empty?
		  	elsif tag[:self_closing_tag]
	        	# Добавляем самозакрывающийся тег в текущий тег
	        	self_closing_tag = Tag.create_self_closing_tag(tag[:self_closing_tag],tag[:props])
	    		current_tag.add_child(self_closing_tag)
	     	end
	    end
	    
	    HtmlTree.new(root)  # Возвращаем корневой элемент дерева
	end

	def self.parse_attributes(props_str)
	    return {} unless props_str
	    props = {}
	    props_str.scan(/(\w+)\s*=\s*"([^"]*)"/).each do |key, value|
	    	props[key.to_sym] = value
	    end
	    props
	end

	def each(&block)
		depth_search(block)
	end

	#обход дерева в глубину
	def depth_search(&block)
		stack = [@root]
		until stack.empty?
			current_tag = stack.pop #извлекаем последний элемент
			block.call(current_tag)
			if current_tag.children
				stack.concat(current_tag.children.reverse)
			end
		end
	end

	#обход дерева в ширину
	def breadth_search(&block)
		queue = [@root]
		until queue.empty?
			current_tag = queue.shift #извлекаем первый элемент
			block.call(current_tag)
			if current_tag.children
				queue.concat(current_tag.children)
			end
		end
	end
	def select(&block)
		result = []
		queue = [@root]
		until queue.empty?
			current_tag = queue.shift #извлекаем первый элемент
			if block.call(current_tag)
				result.append(current_tag)
			end
			if current_tag.children
				queue.concat(current_tag.children)
			end
		end
		result
	end
	def reduce(accumulator, &block)
		queue = [@root]
		until queue.empty?
			current_tag = queue.shift #извлекаем первый элемент
			accumulator = block.call(accumulator, current_tag)
			if current_tag.children
				queue.concat(current_tag.children)
			end
		end
		accumulator
	end

end