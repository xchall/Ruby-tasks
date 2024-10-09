class Student
	attr_accessor :surname, :name, :patronymic, :id, :phone, :teleg, :email, :git
	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, teleg: nil, email: nil, git: nil)
		if Student.id_valid?(id) == false
			raise ArgumentError, "Неверный формат id пользователя #{id}"
		end
		if Student.surname_valid?(surname) == false
			raise ArgumentError, "Неверный формат фамилии #{surname}"
		end
		if Student.name_valid?(name) == false
			raise ArgumentError, "Неверный формат имени #{name}"
		end
		if Student.patronymic_valid?(patronymic) == false
			raise ArgumentError, "Неверный формат отчества #{patronymic}"
		end
		if Student.phone_valid?(phone) == false
			raise ArgumentError, "Неверный формат номера телефона #{phone}"
		end
		if Student.teleg_valid?(teleg) == false
			raise ArgumentError, "Неверный формат телеграма #{teleg}"
		end
		if Student.email_valid?(email) == false
			raise ArgumentError, "Неверный формат почты #{email}"
		end
		if Student.git_valid?(git) == false
			raise ArgumentError, "Неверный формат гита #{git}"
		end
		@id = id
		@surname = surname
		@name = name 
		@patronymic = patronymic
		@phone = phone
		@teleg = teleg
		@email = email
		@git = git
	end
	def self.phone_valid?(phone)
		if phone == nil
			false
		else
			phone.match?(/^\+7\d{10}$/)
		end
	end
	def self.id_valid?(id)
		if id == nil
			false
		else
			id.match?(/^\d+$/)
		end
	end
	def self.surname_valid?(surname)
		if surname == nil
			false
		else
			surname.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
		end
	end
	def self.name_valid?(name)
		if name == nil
			false
		else
			name.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
		end
	end
	def self.patronymic_valid?(patronymic)
		if patronymic == nil
			false
		else
			patronymic.match?(/^[A-ZА-ЯЁ][a-zа-яё]+$/)
		end
	end
	def self.teleg_valid?(teleg)
		if teleg == nil
			false
		else
			teleg2 = telg.down_case() #имена пользователей тг не чуствительны к регистру
			teleg2.match?(/^@[a-z_0-9]{5,32}+$/)
		end
	end
	def self.email_valid?(email)
		if id == nil
			false
		else
			email.match?(/^[A-Za-z_0-9]+@[A-Za-z_0-9]+\.[A-Za-z]$/)
		end
	end
	def self.git_valid?(git)
		if git == nil
			false
		else
			git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
		end
	end
	def to_s
		"id = #{@id || 'не задано'},\n surname = #{@surname},\n name = #{@name},\n patronymic = #{@patronymic},\n phone = #{@phone || 'не задано'},\n teleg = #{@teleg || 'не задано'},\n email = #{@email || 'не задано'},\n git = #{@git || 'не задано'}"
	end

end