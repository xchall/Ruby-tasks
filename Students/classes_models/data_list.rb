require_relative "data_table"
class DataList
	#сеттер заменяющий массив объектов
	def elems=(elems) 
		@elems = elems
	end
	def initialize(elems:)
		self.elems = elems
		@selected = [] #массив индексов выделенных элементов 
		@some_list = [] #массив заполненный определенным образом, реализация заполнения в наследнике
	end
	def select(number)
		if not (number <= @elems.size-1 && number >= 0)
			raise ArgumentError, "Неверный индекс"
		end
		if not (@selected.include?(number)) 
			@selected.append(number)
		end
	end
	def get_selected()
		copy_selected = @selected.dup #поверхностное копирование
		copy_selected
	end
	#names - наименования столбцов у элементов 
	def get_names()
		names = get_copy_names()
		names
	end
	private def get_copy_names()
		raise NoImplementedError, "Реализация операции get_copy_names в классе наследнике"
	end
	def get_data()
		@some_list = [] #отчищаем
		@elems.each_with_index do |el, ind|
			@some_list.append(into_row(ind+1, el))#нумеруем начиная с 1, ind+1
		end
		DataTable.new(table:@some_list)
	end
	private def into_row(ind, el)
		raise NoImplementedError, "Реализация операции into_row в классе наследнике"
	end
end