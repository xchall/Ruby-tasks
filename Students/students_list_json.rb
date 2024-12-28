require 'json'
require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/data_list_student_short"
require_relative "student_short"
class StudentsListJson < StudentsList
	def read_from_file(file_path)
		file = File.read(file_path)
		data_hash = JSON.parse(file)
		list = []
		data_hash.each do |student|
			st_sh = StudentShort.new(id:student['id'], info: "#{student['surname_in']}\n#{student['git']}\n#{student['contact']}")
			list << st_sh
		end
		@student_list = list
	rescue JSON::ParserError => e
		raise "Некорректный формат JSON: #{e.message}"
	end

	def write_to_file(file_path)
		data = to_hash()
		json_data = JSON.pretty_generate(data)
		File.write(file_path, json_data )
	rescue JSON::GeneratorError => e
		raise "Некорректный формат JSON: #{e.message}"
	end
end