def max_in_interval(mas, a, b)
	max = a - 1
	mas.each do |elem|
		if elem >= a && elem <=b &&  elem > max
			max = elem
		end
	end
	if max == a - 1
		nil
	else
		max
	end
end
def before_min_to_end(mas)
	ind_min = 0
	min = mas[0]
	mas.each_with_index do |elem, ind|
		if elem < min
			min = elem 
			ind_min = ind
		end
	end
	mas_el_bef = []
	mas_el_aft = []
	mas.each_with_index do |elem, ind|
		if ind < ind_min
			mas_el_bef.push(elem)
		else
			mas_el_aft.push(elem)
		end
	end
	mas = mas_el_aft + mas_el_bef
end
def count_after_max(mas)
	count = 0
	max = mas.max
	mas.each do |elem|
		if elem == max
			count = 0
		else
			count += 1
		end
	end
	count
end

