# https://projecteuler.net/problem=2
# `gem install minitest` to install minitest
# `ruby euler_problem_2_test.rb` to run the test
#
require 'minitest/autorun'

class EvenFibonacciNumbersTest < Minitest::Test
  def test_sum_of_even_fibonacci_numbers_below_100
    assert_equal 44, EvenFibonacciNumbers.new.sum_of_even_fibonacci_numbers_below(100)
  end

  def test_sum_of_even_fibonacci_numbers_below_4000000
    assert_equal 4613732, EvenFibonacciNumbers.new.sum_of_even_fibonacci_numbers_below(4000000)
  end
end

class EvenFibonacciNumbers
  def sum_of_even_fibonacci_numbers_below(limit)
      prev_prev_result = 0
      prev_result = 1
      sum = 0

      (0..limit).each do |number|
        result = prev_result + prev_prev_result
        prev_prev_result = prev_result
        prev_result = result

        return sum if result >= limit

        sum = sum + result if result.even?
      end
  end
end