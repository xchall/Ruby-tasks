require_relative "student"
require_relative "student_short"
students = [
	Student.new(surname:"Таран", name:"Дмитрий", patronymic:"Сергеевич",phone:"+79528345611", email:"dimamolod@gmail.com", git:"https://github.com/dmitriy_proger"),
	Student.new(surname:"Бачурин", name:"Данил", patronymic:"Петрович", id:"451", phone:"+79532503465", git:"github.com/danila_krut"),
	Student.new(surname:"Прокопенко", name:"Юрий", patronymic:"Данилович", phone: "+78005553535", email:"Ura228_33@yandex.ru", teleg:"@dsdhshF_hd"),
	Student.new(surname: "Зубенко", name:"Михаил", patronymic: "Петрович", id:"32", phone:"+79528502711", teleg:"@Mishania"),
	Student.new(surname: "Орлов", name:"Иван", patronymic: "Игоревич", id:"46", git:"https://github.com/ivanChampion"),
]
stud_short_first_constructor = []
stud_short_second_constructor = []
students.each do |student|
	puts student, "\n"
	stud_short_first_constructor.push(StudentShort.new(student:student))
	stud_short_second_constructor.push(StudentShort.new(id:student.id, information:student.getInfo()))
	# puts student.getInfo()
	# puts student.getPhio()
	# puts student.getGit()
	# puts student.getContact()
end
stud_short_first_constructor.each do |student|
	puts student, "\n"
end
stud_short_second_constructor.each do |student|
	puts student, "\n"
end