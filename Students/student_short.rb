require_relative "student"
require_relative "student_major"
class StudentShort < StudentMajor
	attr_reader :surname_in, :contact
	def contact=(contact)
		if StudentShort.contact_valid?(contact) == false
			raise ArgumentError, "Неверный формат контакта #{contact}"
		end
		@contact = contact
	end
	def self.contact_valid?(contact)
		if(contact == nil || contact ==" ")
			return true
		end
		con = contact.split(" ")
		if(con.length()!= 2)
			false
		end
		case con[0]
		when "Telegram"
			StudentShort.teleg_valid?(con[1])
		when "Phone_number"
			StudentShort.phone_valid?(con[1])
		when "Email"
			StudentShort.email_valid?(con[1])
		else
			false
		end
	end
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
	def initialize(id:, info:)#нужна валидация
		self.id = id
		information = info.split("\n")
		if information.length()!=3
			raise ArgumentError, "Неверный формат строки информация #{information.length()}"
		end
		self.surname_in = information[0]
		self.git = information[1]
		self.contact = information[2]
	end
	def self.constructor(student:)
		information = "#{student.get_info()}"
		StudentShort.new(id: student.id, info: information)
	end

	def to_s
		"id = #{@id}\nsurnameInicials = #{@surname_in}\ncontact = #{@contact}\ngit = #{@git}"
	end
end