# https://projecteuler.net/problem=6
# The sum of the squares of the first ten natural numbers is:
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is:
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is 3025 - 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.
#
# `gem install minitest` to install minitest
# `ruby euler_problem_6_test.rb` to run the test

require 'minitest/autorun'

class SquareSumDifferenceTest < Minitest::Test
  def test_difference_for_first_10_natural_numbers
    assert_equal 2640, SquareSumDifference.new.difference_for(10)
  end

  def test_difference_for_first_100_natural_numbers
    assert_equal 25164150, SquareSumDifference.new.difference_for(100)
  end
end

class SquareSumDifference
  def difference_for(n)
    sum_of_the_squares = (1..n).map{ |number| number ** 2 }.sum
    square_of_the_sum = (1..n).sum ** 2

    square_of_the_sum - sum_of_the_squares
  end
end
