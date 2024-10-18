def count_after_max(mas)
	count = 0
	max = mas.max
	l_ind = 0
	mas.each do |elem|
		if elem == max
			l_ind = elem
			count = 0
		else
			count += 1
		end
	end
	count
end
