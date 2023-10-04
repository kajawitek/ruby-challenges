# https://projecteuler.net/problem=10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#
# `gem install minitest` to install minitest
# `ruby euler_problem_10_test.rb` to run the test

require 'minitest/autorun'

class PrimeSumTest < Minitest::Test
  def test_sum_of_primes_below_10
    assert_equal 17, PrimeSum.new.sum_of_primes_below(10)
  end

  def test_sum_of_primes_below_100
    skip
    assert_equal 1060, PrimeSum.new.sum_of_primes_below(100)
  end

  def test_sum_of_primes_below_1000
    skip
    assert_equal 76127, PrimeSum.new.sum_of_primes_below(1000)
  end

  def test_sum_of_primes_below_10000
    skip
    assert_equal 5736396, PrimeSum.new.sum_of_primes_below(10000)
  end

  def test_sum_of_primes_below_2_million
    skip
    assert_equal 142913828922, PrimeSum.new.sum_of_primes_below(2_000_000)
  end
end

class PrimeSum
  def sum_of_primes_below(limit)
    numbers = (2..limit)
    numbers.each do |number|
      next unless numbers.include?(number)
      numbers = numbers.map { |x| is_divisible_by(x, number) && x >= number ** 2 ? nil : x }.compact
    end
    numbers.sum
  end

  def is_divisible_by(divisor, dividend)
    (divisor % dividend).zero?
  end

end
