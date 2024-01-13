# frozen_string_literal: true

# https://leetcode.com/problems/longest-palindrome/

# regular answer
def longest_palindrome(s)
  s.chars.tally.reduce(0) do |sum, (_, v)|
    sum += v.odd? ? v - 1 : v
    sum += 1 if v.odd? && sum.even?
    sum
  end
end

# bitwise answer
def longest_palindrome(s)
  s.chars.tally.values.reduce(0) do |sum, v|
    (sum + (v & ~1)) | (v & 1)
  end
end
