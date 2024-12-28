require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/classes_models/data_list"
require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/classes_models/data_table"
class DataListStudentShort < DataList
	def initialize(elems:)
		super(elems:elems)
		@names = ["number", "surname_in", "git", "contact"]
	end
	private def into_row(ind, el)
		[ind, el.surname_in, el.git, el.contact] #все, кроме id
	end
	private def get_copy_names()
		copy_names = @names.dup #поверхностное копирование
		copy_names
	end
end