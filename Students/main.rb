require_relative "student"
students = [
	Student.new(surname:"Таран", name:"Дмитрий", patronymic:"Сергеевич",phone:"+79528345611", email:"dimamolod@gmail.com", git:"https://github.com/dmitriy_proger"),
	Student.new(surname:"Бачурин", name:"Данил", patronymic:"Петрович", id:"451", phone:"+79532503465", git:"github.com/danila_krut"),
	Student.new(surname:"Прокопенко", name:"Юрий", patronymic:"Данилович", phone: "+78005553535", email:"Ura228_33@yandex.ru", teleg:"@Mishania"),
	Student.new(surname: "Зубенко", name:"Михаил", patronymic: "Петрович", id:"32", phone:"+79528502711", teleg:"@dssxsx_Sd12D"),
]
students.each do |student|
	puts student, "\n"
end