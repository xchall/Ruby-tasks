require_relative "student"
students = [
	Student.new(surname:"Таран", name:"Дмитрий", patronymic:"Сергеевич", email:"dimamolod@gmail.com"),
	Student.new(surname:"Бачурин", name:"Данил", patronymic:"Петрович", id:"451", git:"github.com/danila_krut"),
	Student.new(surname:"Прокопенко", name:"Юрий", patronymic:"Данилович", phone: "+78005553535"),
	Student.new(surname: "Зубенко", name:"Михаил", patronymic: "Петрович", id:"32", phone:"+79528502711"),
]
students.each do |student|
	puts student, "\n"
end