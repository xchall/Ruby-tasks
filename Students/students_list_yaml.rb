require 'yaml'
require_relative "C:/Users/max/Desktop/3_curs_1_sem/Ruby/Students/data_list_student_short"
require_relative "student_short"
class StudentsListYaml < Interface
	def read_from_file(file_path)
		data_hash = YAML.load_file(file_path) #ключи это символы
		list = []
		data_hash.each do |student|
			st_sh = StudentShort.new(id:student[:id], info: "#{student[:surname_in]}\n#{student[:git]}\n#{student[:contact]}")
			list << st_sh
		end
		list
	rescue Psych::SyntaxError => e
		raise "Некорректный формат YAML: #{e.message}"
	end
	def write_to_file(file_path, student_list)
		data = to_hash()
		File.write(file_path, data.to_yaml)
	rescue Psych::SyntaxError => e
		raise "Некорректный формат YAML: #{e.message}"
	end
	private def to_hash()
		data_hash = []
		student_list.each do |el|
			hash = {}
			hash[:id] = el.id
			hash[:surname_in] = el.surname_in
			hash[:git] = el.git
			hash[:contact] = el.contact
			data_hash << hash
		end
		data_hash
	end
end