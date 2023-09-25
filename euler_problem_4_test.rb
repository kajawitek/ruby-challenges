# Problem 4: Largest palindrome product
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# https://projecteuler.net/problem=4
# `gem install minitest` to install minitest
# `ruby euler_problem_4_test.rb` to run the test
#
require 'minitest/autorun'

class LargestPalindromeProductTest < Minitest::Test
  def test_largest_palindrome_from_2_digit_products
    assert_equal 9009, LargestPalindromeProduct.new.largest_palindrome_from_products_of(2)
  end

  def test_largest_palindrome_from_3_digit_products
    assert_equal 906609, LargestPalindromeProduct.new.largest_palindrome_from_products_of(3)
  end

  def test_largest_palindrome_from_4_digit_products
    skip "This test might take a while to run, remove this line if you wish to test with this large number"
    assert_equal 99000099, LargestPalindromeProduct.new.largest_palindrome_from_products_of(4)
  end
end

class LargestPalindromeProduct
  def largest_palindrome_from_products_of(digits)
    palindrome_max = 0
    range = (10 ** (digits-1)...10 ** digits)
    range.reverse_each do |first_number|
      range.reverse_each do |second_number|
        product = first_number * second_number
        palindrome_max = product if is_palindrome?(product) && product > palindrome_max
      end
    end
    palindrome_max
  end

  def is_palindrome?(product)
    product.to_s.reverse == product.to_s
  end
end
