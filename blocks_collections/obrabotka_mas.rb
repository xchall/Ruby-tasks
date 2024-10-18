class ObrabotkaMas
	def initialize(mas)
		@mas = mas
	end
	def get_elem_ind(index)
		@mas[index]
	end
	def array
 		@array.dup
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