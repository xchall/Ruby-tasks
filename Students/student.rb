require_relative "student_major"
class Student < StudentMajor
	attr_accessor :surname, :name, :patronymic, :id
	attr_reader :phone, :teleg, :email, :git 
	def surname=(surname)
		if Student.surname_valid?(surname) == false
			raise ArgumentError, "Неверный формат фамилии #{surname}"
		end
		@surname = surname 
	end
	def name=(name)
		if Student.name_valid?(name) == false
			raise ArgumentError, "Неверный формат имени #{name}"
		end
		@name = name
	end
	def patronymic=(patronymic)
		if Student.patronymic_valid?(patronymic) == false
			raise ArgumentError, "Неверный формат отчества #{patronymic}"
		end
		@patronymic = patronymic
	end
	private def phone=(phone)
		if Student.phone_valid?(phone) == false
			raise ArgumentError, "Неверный формат номера телефона #{phone}"
		end
		@phone = phone
	end
	private def teleg=(teleg)
		if Student.teleg_valid?(teleg) == false
			raise ArgumentError, "Неверный формат телеграма #{teleg}"
		end
		@teleg = teleg
	end
	private def email=(email)
		if Student.email_valid?(email) == false
			raise ArgumentError, "Неверный формат почты #{email}"
		end
		@email = email
	end
	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, teleg: nil, email: nil, git: nil)
		self.id = id #через self вызывается setter, а не сразу обращаемся к полю @
		self.surname = surname
		self.name = name 
		self.patronymic = patronymic
		self.phone = phone
		self.teleg = teleg
		self.email = email
		self.git = git
	end
	def getInfo()
		information = self.getPhio()
		information += " Git: "
		if self.git!= nil
			information += "#{self.git} "
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
			information += "#{self.git} "
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
			contact += "Номер_телефона #{self.phone}"
		else
			contact += "Отсутствует"
		end
	end
	def set_contacts(phone: nil, teleg: nil, email: nil)
		if phone != nil
			self.phone = phone
		end
		if teleg != nil
			self.teleg = teleg
		end
		if email != nil
			self.email = email
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
end