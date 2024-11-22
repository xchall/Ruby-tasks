require_relative "C:/Users/max/Desktop/Ruby/Students/classes_models/data_list"
require_relative "C:/Users/max/Desktop/Ruby/Students/classes_models/data_table"
require_relative "data_list_student_short"
require_relative "student_short"

students = [
	Student.new(surname:"Таран", name:"Дмитрий", patronymic:"Сергеевич",phone:"+79528345611", email:"dimamolod@gmail.com", git:"https://github.com/dmitriy_proger"),
	Student.new(surname:"Бачурин", name:"Данил", patronymic:"Петрович", id:"451", phone:"+79532503465", git:"github.com/danila_krut"),
	Student.new(surname:"Прокопенко", name:"Юрий", patronymic:"Данилович", phone: "+78005553535", email:"Ura228_33@yandex.ru", teleg:"@dsdhshF_hd"),
	Student.new(surname: "Зубенко", name:"Михаил", patronymic: "Петрович", id:"32", phone:"+79528502711", teleg:"@Mishania"),
	Student.new(surname: "Орлов", name:"Иван", patronymic: "Игоревич", id:"46", git:"https://github.com/ivanChampion"),
]
a = []
(0..4).each do |i|
	a.append(StudentShort.init_from_student(student:students[i]))
# print(a.surname_in," ", a.git, " ", a.contact)
end
b = DataListStudentShort.new(elems:a)
c = b.get_data()
(0..c.row_count-1).each do |i|
	(0..c.col_count-1).each do |j|
		print(c.get_element(i, j), " ")
	end
	print("\n")
end