#минимальный элемент
def min_item(arr)
	min = arr[0].to_i
	for x in arr do 
		xx = x.to_i
		min = xx if xx < min
	end
	return min
end	
#номер первого положительного элемента
def num_first_pos(arr)
	i = 0
	while i < arr.length do 
		xx = arr[i].to_i
		return i if xx > 0
		i+=1
	end
	#если не нашлось ни одного положительного элемента -1
	return -1
end

puts ("1.Минимальный элемент массива \n2.Первый положительный элемент массива \nВыберите метод (напишите 1 или 2):  ")
met = gets.chomp
#C:\Users\max\Desktop\Ruby\test\mass_example.txt
puts ("Введите путь к файлу, содержащий массив для обработки")
fpath = gets.chomp
if( met != "1" and met != "2") then
	puts "Метод выбран неверно"
	exit
end
first_line = ""
File.open(fpath, 'r') do |file|
	first_line = file.gets
end
arr = first_line.split(' ')
case met 
	when  "1"
		puts("Минимальный элемент массива #{min_item(arr)}")
	when "2"
		puts("Номер первого положительного элемента массива #{num_first_pos(arr)+1}")
end