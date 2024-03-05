# frozen_string_literal: true

# https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends

require 'pry-nav'

def minimum_length(s)
  left = 0
  right = s.length - 1
  while left < right
      break if s[left] != s[right]
      cur = s[left]
      left += 1 while s[left] == cur && left <= right
      right -= 1 while s[right] == cur && right >= left
  end
  right < left ? 0 : right - left + 1
end
