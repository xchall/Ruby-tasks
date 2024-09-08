print "Напишите ваше имя: "
username = gets.chomp
puts "Здравствуйте #{username}, какой у вас любимый язык программирования?"
prog_lan = gets.chomp
prog_lan = prog_lan.downcase
if(prog_lan == "ruby") then
	puts "А вы подлиза!"
else puts "Скоро Ruby станет вашим любимым языком"
	if(prog_lan == "java") then
		puts "Интересный выбор"
	elsif(prog_lan == "c++") then
		puts "А вы любитель математики!"
	elsif(prog_lan == "python") then
		puts "Неплохой выбор"
	end
end
puts "#{username}, введите команду языка Ruby"
rcom = gets.chomp
puts "#{username}, введите команду OC"
scom = gets.chomp
eval(rcom)
puts "Выполнили команду Ruby"
system(scom)
puts "Выполнили команду OC"

