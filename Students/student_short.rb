require_relative "student"
class StudentShort 
	attr_reader :id, :surname_in, :git, :contact
	def initialize(student:nil, id:nil , information:nil)
		if student != nil
			@surname_in = student.getPhio()
			@git = student.git
			@id = student.id
			@contact = student.getContact()
		elsif   information != nil
			@id = id
			raspakovka_inform(information)
		end
	end
	def raspakovka_inform(information) #декодирование
		arr = information.split(" ")
		@surname_in = arr[1] + arr[2]
		@git = arr[4]
		if(arr[6] != "Отсутствует")
			@contact = arr[6] + " " + arr[7]
		else
			@contact = arr[6]
		end
	end
	def to_s
		"id = #{@id || 'не задано'}\n surnameInicials = #{@surname_in}\n contact = #{@contact}\n git = #{@git || 'не задано'}"
	end
end