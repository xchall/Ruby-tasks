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
end

