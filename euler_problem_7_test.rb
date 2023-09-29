# https://projecteuler.net/problem=7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10,001st prime number?
#
# `gem install minitest` to install minitest
# `ruby euler_problem_7_test.rb` to run the test

require 'minitest/autorun'

class PrimeNumberTest < Minitest::Test
  def test_6th_prime_number
    # skip
    assert_equal 13, PrimeNumber.new.nth_prime(6)
  end

  def test_7th_prime_number
    # skip
    assert_equal 17, PrimeNumber.new.nth_prime(7)
  end

  def test_10th_prime_number
    # skip
    assert_equal 29, PrimeNumber.new.nth_prime(10)
  end

  def test_10001st_prime_number
    # skip
    assert_equal 104743, PrimeNumber.new.nth_prime(10001)
  end
end

class PrimeNumber
  def nth_prime(n)
    numbers = (2..estimated_nth_prime(n)).to_a

    numbers.each do |number|
      next unless numbers.include?(number)

      numbers = numbers.map { |x| is_divisible_by(x, number) && x >= number ** 2 ? nil : x }.compact
    end
    numbers[n-1]
  end

  def is_prime?(number)
    (2...Math.sqrt(number)).each do |index|
      return false if (number % index).zero?
    end
    true
  end

  def estimated_nth_prime(n)
    n * Math.log(n) + n * Math.log(Math.log(n)).ceil
  end

  def is_divisible_by(divisor, dividend)
    (divisor % dividend).zero?
  end
end
