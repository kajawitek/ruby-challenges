# Problem 3: Largest prime factor
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
#
# https://projecteuler.net/problem=3
# `gem install minitest` to install minitest
# `ruby euler_problem_3_test.rb` to run the test
#
require 'minitest/autorun'

class LargestPrimeFactorTest < Minitest::Test
  def test_largest_prime_factor_of_13195
    assert_equal 29, LargestPrimeFactor.new.largest_prime_factor_of(13195)
  end

  def test_largest_prime_factor_of_600851475143
    # skip "This test might take a while to run, remove this line if you wish to test with this large number"
    assert_equal 6857, LargestPrimeFactor.new.largest_prime_factor_of(600851475143)
  end
end

class LargestPrimeFactor
  def largest_prime_factor_of(number)
    prime_factors = []
    (number/2).times do |index|
      next if index == 0
      if number % index == 0
        prime_factors << index if is_prime?(index)
      end
    end
    prime_factors.max
  end

  def is_prime?(number)
    (2...number).each do |index|
      return false if number % index == 0
    end
    true
  end
end
