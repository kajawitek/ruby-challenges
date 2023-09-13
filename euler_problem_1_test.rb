# https://projecteuler.net/problem=1
# `gem install minitest` to install minitest
# `ruby euler_problem_1_test.rb` to run the test
#
require 'minitest/autorun'

class MultiplesOfThreeAndFiveTest < Minitest::Test
  def test_sum_of_multiples_below_10
    assert_equal 23, MultiplesOfThreeAndFive.new.sum_of_multiples_below(10)
  end

  def test_sum_of_multiples_below_1000
    assert_equal 233168, MultiplesOfThreeAndFive.new.sum_of_multiples_below(1000)
end

class MultiplesOfThreeAndFive
  def sum_of_multiples_below(n)
    result = 0
    (1...n).each do |x|
      if x%5 == 0 || x%3 == 0
        result = result + x
      end
    end
    result
  end
end
