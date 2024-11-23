class ObrabotkaMas
	attr_reader :mas
	private def mas=(mas)
		if mas.is_a?(Array)
			@mas = mas
		else
			raise ArgumentError, "Не является массивом #{mas}"
		end
	end
	def initialize(mas)
		self.mas = mas
	end
	def get_elem_ind(index)
		if(index < @mas.length && index >= 0)
			@mas[index]
		else 
			"Out of range"
		end
	end
	def array
 		@array.dup #поверхностное копирование
 	end

	def any?(&block)
		if block
			@mas.each do |elem|
				if block.call(elem)
					return true
				end
			end
			return false
		else 
			"No any block"
		end
	end
	def find_index(&block)
		if block
			@mas.each_with_index do |elem, ind|
				if block.call(elem)
					return ind
				end
			end
			return nil
		else 
			"No any block"
		end
	end
	def none?(&block)
		if block
			@mas.each_with_index do |elem, ind|
				if block.call(elem)
					return false
				end
			end
			return true
		else 
			"No any block"
		end
	end
	def reduce(accumulator, &block)
		if block
			@mas.each do |elem|
				accumulator = block.call(accumulator, elem)
			end
			return accumulator
		else 
			"No any block"
		end
	end
	def min_max(&block)
		if @mas.nil? 
			return [nil, nil]
		min = @mas[0]
		max = @mas[0]
		@mas.each do |elem|
			if block
				max = elem if block.call(el, min) < 0
				min = elem if block.call(el, max) > 0
			else:
				max = elem if elem > max
				min = elem if elem < min
		end
		return [min, max]
	end
	def find_all
		if block_given?
			ans = []
			@mas.each do |elem|
				if yield(elem) 
					ans<<elem
				end
			end
			return ans
		else 
			"No any block"
		end
	end
end
