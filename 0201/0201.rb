# frozen_string_literal: true

# https://leetcode.com/problems/bitwise-and-of-numbers-range

def range_bitwise_and(left, right)
  return 0 if left.zero?

  count = 0
  while left != right
    left >>= 1
    right >>= 1
    count += 1
  end
  right << count
end
