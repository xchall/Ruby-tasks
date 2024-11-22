require_relative "data_table"
class DataList
	def initialize(elems:)
		@elems = elems
		@selected = [] #массив индексов выделенных элементов 
		@some_list = [] #массив заполненный определенным образом, реализация заполнения в наследнике
	end
	def select(number)
		if not (number <= @elems.size-1 && number >= 0)
			raise Exception, "Неверный индекс"
		end
		if not (selected.include?(number)) 
			selected.append(number)
		end
	end
	def get_selected()
		@selected 
	end
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