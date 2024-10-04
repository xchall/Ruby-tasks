class Student
	def initialize(surname, name, patronymic, id = nil, phone = nil, teleg = nil, email = nil, git = nil)
		@surname = surname
		@name = name 
		@patronymic = patronymic
		@phone = phone
		@teleg = teleg
		@email = email
		@git = git
	end
	#геттеры
	def surname
		@surname
	end
	def name
		@name
	end
	def patronimic
		@patronymic
	end
	def phone
		@phone
	end
	def teleg
		@teleg
	end
	def email
		@email
	end
	def git
		@git
	end
	#сеттеры
	def surname=(surname_v)
		@surname = surname_v
	end
	def name=(name_v)
		@name = name_v
	end
	def patronimic=(patronimic_v)
		@patronymic = patronimic_v
	end
	def phone=(phone_v)
		@phone = phone_v
	end
	def teleg=(teleg_v)
		@teleg = teleg_v
	end
	def email=(email_v)
		@email = email_v
	end
	def git=(git_v)
		@git = git_v
	end

end