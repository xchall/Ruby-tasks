def count_after_max(mas)
	max = mas.max
	lm_ind = mas.rindex(max)
	mas.length - lm_ind - 1
end
def before_min_to_end(mas)
	min = mas.min
	m_ind = mas.index(min)
	mas = mas[m_ind..mas.length-1] + mas[0..m_ind]
end