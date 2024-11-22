require_relative "data_table"
class DataList
	def initialize(elems:)
		@elems = elems
		@selected = [] #массив индексов выделенных элементов 
		some_list = [] #массив заполненный определенным образом, реализация заполнения в наследнике
	end
	def select(number)
		if not (number <= @elems.size-1 && number >= 0)
			raise Exception, "Неверный индекс"
		if not (selected.include?(number)) selected.append(number)
	def get_selected()
		@selected 
	def get_names()
		raise Exception, "Реализация метода get_names в классе наследнике"
	end
	def get_data()
		DataTable(some_list)
	end
end