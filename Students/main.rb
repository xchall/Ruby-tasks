require_relative "student"
students = [
	Student.new("Таран", "Дмитрий", "Сергеевич",),
	Student.new("Бачурин", "Данил", "Петрович", "451"),
	Student.new("Прокопенко", "Юрий", "Данилович"),
	Student.new("Зубенко", "Михаил", "Петрович", "32", "+79528502711"),
]
students.each do |student|
	puts student, "\n"
end