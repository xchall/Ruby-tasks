require_relative "obrabotka_mas"

tests = {any?: "failed", find_index: "failed", none?: "failed", reduce: "failed", min_max: "failed", find_all: "failed"}
a = [4, 3, 21,3, 7, 51, 243, 12, 3, 0, 9, 8]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
c = [9, 7, "sds", 34, ' ', "aDs", 'f', 45, 9.1, -12]
m1 = ObrabotkaMas.new(a)
m2 = ObrabotkaMas.new(b)
m3 = ObrabotkaMas.new(c)

if m2.any? {|el| el>= 11} && m3.any?{|el| el.is_a?(String) }
	tests[:any?] = "successfully"
end
if m1.find_index {|el| el % 9 == 0} == 6 && m3.find_index{|el| el.is_a?(String) } == 2
	tests[:find_index] = "successfully"
end
if m1.none? {|el| el % 9 == 0} == false && m2.none?{|el| el.is_a?(String)} && m2.none? {|el| el > 20} 
	tests[:none?] = "successfully"
end
if m1.reduce(0) {|sum, el| sum + el} == 364  && m2.reduce(1){|sum, el| sum*el} == 87178291200
	tests[:reduce] = "successfully"
end
if m1.min_max ==[0, 243]  && m2.min_max == [1, 14]
	tests[:min_max] = "successfully"
end
if m1.find_all {|el| el>= 11} == [21, 51, 243, 12]  && m3.find_all{|el| el.is_a?(String)} == ["sds", " ", "aDs", "f"]
	tests[:find_all] = "successfully"
end
print(tests)