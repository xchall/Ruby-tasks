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
