require 'yaml'
require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/data_list_student_short"
require_relative "student_short"
class StudentsListYaml < StudentsList
	def read_from_file(file_path)
		data_hash = YAML.load_file(file_path) #ключи это символы
		list = []
		data_hash.each do |student|
			st_sh = StudentShort.new(id:student[:id], info: "#{student[:surname_in]}\n#{student[:git]}\n#{student[:contact]}")
			list << st_sh
		end
		@student_list = list
	rescue Psych::SyntaxError => e
		raise "Некорректный формат YAML: #{e.message}"
	end
	def write_to_file(file_path)
		data = to_hash()
		File.write(file_path, data.to_yaml)
	rescue Psych::SyntaxError => e
		raise "Некорректный формат YAML: #{e.message}"
	end

end