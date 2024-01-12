# frozen_string_literal: true

# https://leetcode.com/problems/valid-palindrome/

require 'pry-nav'

def is_palindrome(s)
  parsed = s.downcase.gsub(/[^a-z|0-9]/, '')
  i = 0
  j = parsed.length - 1
  while i <= j
    return false if parsed[i] != parsed[j]

    i += 1
    j -= 1
  end
  true
end
