#функцая на проверку простоты числа
def check_prost(a)
	if(a == 1 ) then
		return false 
	end
	j = 2
	while j < a do 
		if(a % j == 0) then
			return false
		end
		j = j+1
	end
	return true
end
#Сумма простых делителей числа
print "Введите число "
num = gets.chomp
num = num.to_i
sum = 0
i = 2
while i <= num do 
	#проверка на делимость
	if( num % i == 0) then
		if check_prost(i)
			sum = sum + i 
		end
	end
	i= i+1
end
puts "Сумма простых делителей числа #{num} равна #{sum}"