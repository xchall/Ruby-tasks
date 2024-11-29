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
		if not (selected.include?(number)) 
			selected.append(number)
		end
	end
	def get_selected()
		@selected 
	end
	#names - наименования столбцов у элементов 
	def get_names()
		raise NoImplementedError, "Реализация метода get_names в классе наследнике"
	end
	def get_data()
		fill_some_list()
		DataTable.new(table:@some_list)
	end
	private def fill_some_list()
		raise NoImplementedError, "Реализация операции заполнения some_list в классе наследнике"
	end
end