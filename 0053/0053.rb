# frozen_string_literal: true

# https://leetcode.com/problems/maximum-subarray

def max_sub_array(nums)
  max = sum = -Float::INFINITY
  nums.each do |num|
    sum = [sum + num, num].max
    max = [max, sum].max
  end
  max
end
