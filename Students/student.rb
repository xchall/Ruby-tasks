class Student
	attr_accessor :surname, :name, :patronymic, :id
	attr_reader :phone, :teleg, :email, :git #теперь без сеттеров
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
	def getInfo()
		information = self.getPhio()
		information += " Git: "
		if self.git!= nil
			information += "#{self.git}"
		else 
			information += "Отсутствует "
		end
		information += self.getContact()
	end
	def getPhio()
		information = "ФИО: #{self.surname} #{self.name[0]}.#{self.patronymic[0]}."
	end
	def getGit()
		information = "Git: "
		if self.git!= nil
			information += "#{self.git}"
		else 
			information += "Отсутствует "
		end
	end
	def getContact()
		contact = "Контакт: "
		if self.teleg!=nil 
			contact += "Telegram #{self.teleg}"
		elsif self.email!=nil 
			contact += "Почта #{self.email}"
		elsif self.phone!=nil
			contact += "Номер телефона #{self.phone}"
		else
			contact += "Отсутствует"
		end
	end
	def set_contacts(phone: nil, teleg: nil, email: nil)
		if phone != nil && Student.phone_valid?(phone)
			@phone = phone
		end
		if teleg != nil && Student.teleg_valid?(teleg)
			@teleg = teleg
		end
		if email != nil && Student.email_valid?(email)
			@email = email
		end
	end
	def has_git?()
		if self.git == nil
			false
		else
			true
		end
	end

	def has_phone?()
		if self.phone == nil
			false
		else
			true
		end
	end
	def has_teleg?()
		if self.teleg == nil
			false
		else
			true
		end
	end
	def has_email?()
		if self.email == nil
			false
		else
			true
		end
	end
	def contain?()
		return self.has_git?() && (self.has_email?() || self.has_teleg?() || self.has_phone?() || self.has_email?())
	end
	def self.phone_valid?(phone)
		if phone == nil
			true
		else
			phone.match?(/^\+7\d{10}$/)
		end
	end
	def self.id_valid?(id)
		if id == nil
			true
		else
			id.match?(/^\d+$/)
		end
	end
	def self.surname_valid?(surname)
		if surname == nil
			false #фио обязательное
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
			true
		else
			teleg2 = teleg.downcase() #имена пользователей тг не чуствительны к регистру
			teleg2.match?(/^@[a-z_0-9]{5,32}+$/)
		end
	end
	def self.email_valid?(email)
		if email == nil
			true
		else
			email.match?(/^[A-Za-z_0-9]+@[A-Za-z_0-9]+\.[A-Za-z]+$/)
		end
	end
	def self.git_valid?(git)
		if git == nil
			true
		else
			git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
		end
	end
	def to_s
		"id = #{@id || 'не задано'},\n surname = #{@surname},\n name = #{@name},\n patronymic = #{@patronymic},\n phone = #{@phone || 'не задано'},\n teleg = #{@teleg || 'не задано'},\n email = #{@email || 'не задано'},\n git = #{@git || 'не задано'}"
	end
end