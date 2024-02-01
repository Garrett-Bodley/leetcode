# frozen_string_literal: true

# https://leetcode.com/problems/divide-array-into-arrays-with-max-difference

def divide_array(nums, k)
  nums.sort.each_slice(3).to_a.each { |slice| return [] if slice.max - slice.min > k  }
end
