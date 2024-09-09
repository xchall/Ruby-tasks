#функцая нахождения суммы цифр числа a
def sum_cifr(a) 
	str = a.to_s
	arr = str.chars
	sum_c = 0
	arr.each do |i|
		sum_c+=i.to_i
	end
	return sum_c
end
#Произведение делителей числа, сумма цифр которых меньше суммы цифр исходного числа
print "Введите число "
num = gets.chomp
num = num.to_i
sum_c_num = sum_cifr(num)
proiz = 1
i = 2
while i <= num do 
	#проверка на делимость
	if( num % i == 0) then
		proiz *= i if sum_cifr(i)<sum_c_num
		#puts i
	end
	i= i+1
end
puts "Произведение делителей числа #{num}, сумма цифр которых меньше суммы цифр #{num}, равна #{proiz}"