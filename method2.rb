print "Введите число "
num = gets.chomp
#оставим число в формате строки, чтобы реобразовать в массив символов
amount = 0
arr = num.chars 
arr.each do |i|
	digit = i.to_i
	if(digit > 3 and digit % 2 != 0) then
		amount += 1 
	end
end
puts "Количество нечетных цифр, которые больше 3 в числе #{num} равно #{amount}" 
