# Problem 5: Smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#
# https://projecteuler.net/problem=5
# `gem install minitest` to install minitest
# `ruby euler_problem_5_test.rb` to run the test
#
require 'minitest/autorun'

class SmallestMultipleTest < Minitest::Test
  def test_smallest_multiple_for_10
    assert_equal 2520, SmallestMultiple.new.smallest_evenly_divisible_up_to(10)
  end

  def test_smallest_multiple_for_20
    # skip, "This test might take a while to run, remove this line if you wish to test with this large number"
    assert_equal 232792560, SmallestMultiple.new.smallest_evenly_divisible_up_to(20)
  end
end

class SmallestMultiple
  def smallest_evenly_divisible_up_to(n)
    factorial_of_n = 1
    status = false

    n.times do |index|
      factorial_of_n *= index + 1
    end

    (n..factorial_of_n).each do |number|
      (1..n).each do |index|
        break if number % index != 0

        status = true if index == n
      end
      return number if status
    end
  end
end
