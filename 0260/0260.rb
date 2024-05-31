# frozen_string_literal: true

# https://leetcode.com/problems/single-number-iii/description

require 'pry-nav'

def single_number(nums)
  xor = nums.reduce(0) { _1 ^ _2 }
  bit = xor.to_s(2).reverse.index('1')
  mask = 2**bit
  a = b = 0
  nums.each do |num|
    if num & mask == mask
      a ^= num
    else
      b ^= num
    end
  end
  [a, b]
end
