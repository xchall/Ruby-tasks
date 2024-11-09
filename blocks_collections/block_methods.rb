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
