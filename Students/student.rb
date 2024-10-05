class Student
	attr_accessor :surname, :name, :patronymic, :id, :phone, :teleg, :email, :git
	def initialize(surname:, name:, patronymic:, id: nil, phone: nil, teleg: nil, email: nil, git: nil)
		@id = id
		@surname = surname
		@name = name 
		@patronymic = patronymic
		@phone = phone
		@teleg = teleg
		@email = email
		@git = git
	end
	def to_s
		"id = #{@id || 'не задано'},\n surname = #{@surname},\n name = #{@name},\n patronymic = #{@patronymic},\n phone = #{@phone || 'не задано'},\n teleg = #{@teleg || 'не задано'},\n email = #{@email || 'не задано'},\n git = #{@git || 'не задано'}"
	end

end