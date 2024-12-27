class Tag

	attr_accessor :name, :props, :children, :text, :type, :parent

	def initialize(name, props = {}, children, type, text)
		@name = name
		@props = props
		@children = []
		@type = type
		@text = text
	end
	def self.create_self_closing_tag(name,props = {})
    	Tag.new(name,props,nil,"self_closing_tag",nil)
  	end
  
  	def self.create_text_node(text)
    	Tag.new(nil,nil,nil,"text_node",text)
  	end
  
  	def self.create_tag(name,props = {})
    	Tag.new(name,props,[],"default_tag",nil)
  	end
	def to_s
		"Название: #{@name}, параметры: #{@props}"
	end
	def add_child(tag)
	    tag.parent = self  #self это текущий current_tag
	    @children << tag if @text.nil? #text используется только для текстового узла
	    #условие нужно, чтобы не могли добавить ребенка текстовому узлу
    end
	def children_amount
		@children.size
	end

	def has_children
		if @children.empty?
			return false
		end
		true
	end
	def has_style()
		return false if @type == "text_node" || @props == nil
		return true if @props[:style]
		false
	end
end