require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/classes_models/data_list"
require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/classes_models/data_table"
class DataListStudentShort < DataList
	def initialize(elems:)
		super(elems:elems)
		@names = ["number", "surname_in", "git", "contact"]
	end
	def get_names()#getter
		copy_names = @names.dup
		copy_names
	end
	private def into_row(ind, el)
		[ind, el.surname_in, el.git, el.contact] #все, кроме id
	end
end