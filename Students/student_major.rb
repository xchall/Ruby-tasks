class StudentMajor
	attr_reader :phone, :teleg, :email, :git, :id 
	def id=(id)
		if StudentMajor.id_valid?(id) == false
			raise ArgumentError, "Неверный формат id пользователя #{id}"
		end
		@id = id
	end
	private def git=(git)
		if StudentMajor.git_valid?(git) == false
			raise ArgumentError, "Неверный формат гита #{git}"
		end
		@git = git
	end
	def initialize(id: nil, git: nil)
		self.id = id 
		self.git = git
	end
	def self.id_valid?(id)
		if id == nil
			true
		else
			id.match?(/^\d+$/)
		end
	end
	def self.phone_valid?(phone)
		if phone == nil
			true
		else
			phone.match?(/^\+7\d{10}$/)
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
		if git == nil || git ==" "
			true
		else
			git.match?(/^(https:\/\/)?github.com\/[a-zA-Z0-9_-]+$/)
		end
	end
	def to_s
		"id = #{@id}\nsurname = #{@surname}\nname = #{@name}\npatronymic = #{@patronymic}\nphone = #{@phone}\nteleg = #{@teleg}\nemail = #{@email}\ngit = #{@git}"
	end
end