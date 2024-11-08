def count_after_max(mas)
	max = mas.max
	lm_ind = mas.rindex(max)
	mas.length - lm_ind - 1
end