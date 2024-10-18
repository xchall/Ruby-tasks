class ObrabotkaMas
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
		if(index < @mas.length && index > 0)
			@mas[index]
		else 
			"Out of range"
		end
	end
	def array
 		@array.dup #поверхностное копирование, для глубокого Marshal
 	end
	def any?(&block)
		if block_given?
			@mas.each do |elem|
				if yield(elem) #или block.call(elem)
					return true
				end
			end
			return false
		else 
			"No any block"
		end
	end
	def find_index(&block)
		if block_given?
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
		if block_given?
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
		if block_given?
			@mas.each do |elem|
				accumulator = block.call(accumulator, elem)
			end
			return accumulator
		else 
			"No any block"
		end
	end
	def min_max
		min = @mas[0]
		max = @mas[0]
		@mas.each do |elem|
			max = elem if elem > max
			min = elem if elem < min
		end
		return min, max
	end
end
