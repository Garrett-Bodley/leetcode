# frozen_string_literal: true

# https://leetcode.com/problems/bitwise-and-of-numbers-range

require 'pry-nav'

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

# Not sure what I was doing on these two tbh
def range_bitwise_or(left, right)
  res = msb_set = Math.log2(left).floor
  mask = 1
  while mask < msb_set
    res |= mask
    mask << 1
  end
  res
end

def brute_force(left, right)
  return right if left.zero?
  return left if left == right

  (left..right).to_a.reduce(0) { _1 | _2 }
end
