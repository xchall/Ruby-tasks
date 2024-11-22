require_relative "student_major"
class Student < StudentMajor
	attr_reader :surname, :name, :patronymic
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
		super(id:id, git:git)
		self.surname = surname #через self вызывается setter, а не сразу обращаемся к полю @
		self.name = name 
		self.patronymic = patronymic
		self.set_contacts(phone: phone, teleg: teleg, email: email)
		phio()
	end
	private def phio()
		@surname_in = "#{@surname} #{@name[0]}.#{@patronymic[0]}."
	end
	def get_info()
		information = surname_in + "\n"
		if self.has_git?()
			information += self.git
		else
			information+= " "
		end
		information += "\n"
		if self.has_contact?() 
			information += self.get_contact() 
		else
			information+= " "
		end
		return information
	end
	def set_contacts(phone:, teleg:, email:)
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
end