# https://projecteuler.net/problem=9
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# `gem install minitest` to install minitest
# `ruby euler_problem_9_test.rb` to run the test

require 'minitest/autorun'

class PythagoreanTripletTest < Minitest::Test
  def test_triplet_product_for_sum_12
    assert_equal 60, PythagoreanTriplet.new.triplet_product_for_sum(12)  # 3 + 4 + 5 = 12 and 3*4*5 = 60
  end

  def test_triplet_product_for_sum_1000
    # skip
    assert_equal 31875000, PythagoreanTriplet.new.triplet_product_for_sum(1000)  # Set the correct value after you solve
  end
end

class PythagoreanTriplet
  def triplet_product_for_sum(sum)
    (1..sum / 3).each do |a|
      (a..sum / 2).each do |b|
        c = (sum - a - b)
        return a * b * c if a + b + c == sum && a**2 + b**2 == c**2
      end
    end
  end
end
