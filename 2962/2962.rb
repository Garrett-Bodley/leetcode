# frozen_string_literal: true

# https://leetcode.com/problems/count-subarrays-where-max-element-appears-at-least-k-times

require 'pry-nav'

def count_subarrays(nums, k)
  max = nums.max
  n = nums.length
  total_subarr = (n * (n + 1)) / 2
  left = right = count = less_than_k = 0
  while right < nums.length
      count += 1 if nums[right] == max
      while count >= k
          count -= 1 if nums[left] == max
          left += 1
      end

  end
end
