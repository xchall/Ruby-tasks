require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/data_list_student_short"
require_relative "student_short"

class StudentsList
	def read_from_file(file_path)
		raise NoImplementedError, "Реализация метода в другом классе"
	end
	def write_to_file(file_path)
		raise NoImplementedError, "Реализация метода в другом классе"
	end
	private def to_hash()
		data_hash = []
		@student_list.each do |el|
			hash = {}
			hash[:id] = el.id
			hash[:surname_in] = el.surname_in
			hash[:git] = el.git
			hash[:contact] = el.contact
			data_hash << hash
		end
		data_hash
	end
	def initialize(student_list: nil)
		@student_list = student_list
	end
	def get_student_by_id(id)
		@student_list.find {|st| st.id == id} 
	end
	def get_k_n_student_short_list(k, n)
		start_ind = k*n
		res = []
		count = 0
		@student_list.each_with_index do |el, ind|
			if ind >= start_ind && count < n
				res << el
				count = count + 1
			end	
		end
		dlssh = DataListStudentShort.new(elems:res)
	end

	def sort_by_surname_in()
		@student_list = @student_list.sort_by {|student| student.surname_in}
	end

	def add_student(student) #id nil почему то 
		mx_id = @student_list.reduce(0) do |mx, st| 
			puts("#{st.id} #{mx}")
			if st.id.to_i > mx
				mx = st.id.to_i
			end
			mx
		end
		mx_id = mx_id + 1
		student.id = mx_id.to_s
		@student_list << student
	end

	def change_student_by_id(id, student)
		@student_list = @student_list.map do |st| 
			if st.id == id  
				st = student
			end
			st
		end
		@student_list
	end

	def delete_student_by_id(id)
		@student_list = @student_list.reject{|el| el.id == id}
	end

	def get_student_short_count()
		@student_list.size
	end
end