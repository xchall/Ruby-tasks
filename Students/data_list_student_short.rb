require_relative "C:/Users/max/Desktop/Ruby/Students/classes_models/data_list"
require_relative "C:/Users/max/Desktop/Ruby/Students/classes_models/data_table"
class DataListStudentShort < DataList
	def initialize(elems:)
		super(elems:elems)
		@names = ["number", "surname_in", "git", "contact"]
	end
	def get_names()#getter
		@names
	end
	private def into_row(ind, el)
		[ind, el.surname_in, el.git, el.contact] #все, кроме id
	end
	def get_data()
		fill_some_list()
		super()
	end
	private def fill_some_list()
		@some_list = [] #отчищаем
		@elems.each_with_index do |el, ind|
			@some_list.append(into_row(ind+1, el))#нумеруем начиная с 1, ind+1
		end
	end
end