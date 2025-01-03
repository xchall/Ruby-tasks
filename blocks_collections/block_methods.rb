def count_after_max(mas)
	max = mas.max
	lm_ind = mas.rindex(max)
	mas.length - lm_ind - 1
end
def before_min_to_end(mas)
	min = mas.min
	m_ind = mas.index(min)
	mas = mas[m_ind..mas.length-1] + mas[0..m_ind-1]
end
def max_in_interval(mas, a, b)
	mas_choosed = mas.select{|x| x>=a && x<=b}
	mas_choosed.max
end
def left_neighbour(mas)
	inds = (1..mas.length-1).select {|i| mas[i] < mas[i-1]}
	return inds, inds.length 
end
def prost(del)
	if del == 2
		true
	end
	(2..del-1).none? {|i| del % i == 0}
end
def dels(num)
	(2..num).select {|del| num % del == 0 && prost(del)}
end
def pos_prost_dels(mas)
	mas.flat_map {|num| dels(num)}.uniq.sort
end
def input_arr() 
	puts "Введите элементы массива (через пробел):"
	input = gets.chomp 
	arr = input.split.map{|x| x.to_i}
	return arr
end
puts "Задачи:\n1) Найти количество элементов, расположенных после последнего максимального.\n
2) Расположить элементы расположенные до минимального в конце массива.\n
3) Найти максимальный из элементов в интервале (a,b).\n
4) Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел.\n
5) Построить список всех положительных простых делителей элементов списка без повторений."
puts "\nВведите номер задачи: "
num = gets.chomp.to_i
case num
when 1 
	arr = input_arr()
	puts count_after_max(arr)
when 2 
	arr = input_arr()
	puts before_min_to_end(arr)
when 3 
	arr = input_arr()
 	puts "Введите интервал (a, b):"
 	puts "a: " 
 	a = gets.chomp.to_i
 	puts "b: " 
 	b = gets.chomp.to_i
 	puts  max_in_interval(arr, a, b)
when 4 
	arr = input_arr() 
	puts left_neighbour(arr)
when 5 
	arr = input_arr()
	puts pos_prost_dels(arr)
end