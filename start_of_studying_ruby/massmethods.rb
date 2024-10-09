#минимальный элемент
def min_item(arr)
	min = arr[0]
	for x in arr do
		min = x if x < min
	end
	min
end	
#первый положительный элемент
def num_first_pos(arr)
	i = 0
	while i < arr.length do 
		return i if arr[i] > 0
		i+=1
	end
	#если не нашлось ни одного положительного элемента -1
	return -1
end