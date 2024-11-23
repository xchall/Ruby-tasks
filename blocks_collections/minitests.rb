require_relative "obrabotka_mas"
require 'minitest/autorun'

class TestMassive < Minitest::Test
attr_reader :arr_processing
	def setup
    @m1 = ObrabotkaMas.new([4, 3, 21,3, 7, 51, 243, 12, 3, 0, 9, 8])
    @m2 = ObrabotkaMas.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14])
    @m3 = ObrabotkaMas.new([9, 7, "sds", 34, ' ', "aDs", 'f', 45, 9.1, -12])
	end
  def test_any?
    assert @m1.any? { |element| element >200 }
    refute @m1.any? { |element| element <0 }
    assert @m1.any? { |element| element == 3}
  end

  def test_find_index
  	assert_equal 1, @m1.find_index { |element| element.odd? }
    assert_equal 1, @m2.find_index { |element| element.even? }
    assert_equal 2, @m1.find_index { |element| element % 7 ==0}
    assert_equal 2, @m3.find_index {|element| element.is_a?(String)}
  end

  def test_none?
    refute @m1.none? {|el| el % 9 == 0}
    assert @m2.none?{|el| el.is_a?(String)}
    assert @m2.none? {|el| el > 20}
  end

  def test_reduce
    assert_equal 364, @m1.reduce(0) {|sum, el| sum + el}
    assert_equal 87178291200, @m2.reduce(1) {|sum, el| sum*el}
  end
  def test_min_max
    assert_equal [0, 243], @m1.min_max 
    assert_equal [1, 14], @m2.min_max {|a, b| a <=> b}
  end
	def test_find_all
    assert_equal [21, 51, 243, 12], @m1.find_all {|el| el>= 11} 
    assert_equal ["sds", " ", "aDs", "f"], @m3.find_all{|el| el.is_a?(String)}
	end
end