class Student
	def initialize(surname, name, patronymic, id = nil, phone = nil, teleg = nil, email = nil, git = nil)
		@id = id
		@surname = surname
		@name = name 
		@patronymic = patronymic
		@phone = phone
		@teleg = teleg
		@email = email
		@git = git
	end
	#геттеры
	def id
		@id
	end
	def surname
		@surname
	end
	def name
		@name
	end
	def patronymic
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
	def id=(id_v)
		@id = id_v
	end
	def surname=(surname_v)
		@surname = surname_v
	end
	def name=(name_v)
		@name = name_v
	end
	def patronymic=(patronymic_v)
		@patronymic = patronymic_v
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
	def to_s
		"id = #{@id || 'не задано'},\n surname = #{@surname},\n name = #{@name},\n patronymic = #{@patronymic},\n phone = #{@phone || 'не задано'},\n teleg = #{@teleg || 'не задано'},\n email = #{@email || 'не задано'},\n git = #{@git || 'не задано'}"
	end

end