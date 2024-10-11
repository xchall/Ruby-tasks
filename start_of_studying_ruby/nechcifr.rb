def nechcifr(num)
	amount = 0
	#оставим число в формате строки, чтобы реобразовать в массив символов
	arr = num.chars 
	arr.each do |i|
		digit = i.to_i
		if(digit > 3 and digit % 2 != 0) then
			amount += 1 
		end
	end
	amount
	
end

