require_relative "student"
require_relative "student_major"
class StudentShort < StudentMajor
	attr_reader :id, :surname_in, :git, :contact
	def surname_in=(surname_in)
		if StudentShort.surname_in_valid?(surname_in) == false
			raise ArgumentError, "Неверный формат фамилии и инициалов #{surname_in}"
		end
		@surname_in = surname_in
	end
	def self.surname_in_valid?(surname_in)
		if surname_in == nil
			false 
		else
			surname_in.match?(/^[A-ZА-ЯЁ][a-zа-яё]+ [A-ZА-ЯЁ]\.[A-ZА-ЯЁ]\.$/)
		end
	end
	def initialize(student:nil, id:nil , information:nil)
		if student != nil
			#проводить валидацию не нужно
			phio = student.getPhio().split(" ")
			@surname_in = phio[1] + " " +phio[2]
			@git = student.git
			@id = student.id
			cont = student.getContact().split(" ")
			if(cont[1] != "Отсутствует") 
				@contact = cont[1] + " " + cont[2]
			else 
				@contact = cont[1]
			end
		elsif   information != nil
			#проводить валидацию нужно
			self.id = id
			raspakovka_inform(information)
		end
	end
	def raspakovka_inform(information) #декодирование
		arr = information.split(" ")
		self.surname_in = arr[1] +" "+ arr[2]
		if arr[4] != "Отсутствует"
			self.git = arr[4]
		else
			@git = arr[4]
		end
		if(arr[6] != "Отсутствует")
			@contact =arr[6]
			case arr[6]
			when "Telegram"
				if StudentShort.teleg_valid?(arr[7])
					@contact += (" " +arr[7])
				else
					raise ArgumentError, "Неверный формат Telegram."
				end
			when "Номер_телефона"
				if StudentShort.phone_valid?(arr[7])
					@contact += (" " +arr[7])
				else
					raise ArgumentError, "Неверный формат номера телефона."
				end
			when "Почта"
				if StudentShort.email_valid?(arr[7])
					@contact += (" " +arr[7])
				else
					raise ArgumentError, "Неверный формат почты."
				end
			else
				raise ArgumentError, "Неверный формат контакта."
			end
		else
			@contact = arr[6]
		end
	end
	def to_s
		"id = #{@id || 'не задано'}\n surnameInicials = #{@surname_in}\n contact = #{@contact}\n git = #{@git || 'не задано'}"
	end
end