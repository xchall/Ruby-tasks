require_relative "C:/Users/max/Desktop/Ruby/Students/data_list"
class DataListStudentShort < DataList
	def initialize(elems:)
		super(elems:elems)
	def get_names()
		["id", "surname_in", "git", "contact"]
	end
	def into_row(ind, el)
		[ind, el.surname_in, el.git, el.contact] #все, кроме id
	end
	def get_data()
		some_list = [] #отчищаем
		@elems.each_with_index do |el, ind|
			some_list.append(into_row(ind+1, el))#нумеруем начиная с 1, ind+1
		super()
	end
end