# frozen_string_literal: true

# https://leetcode.com/problems/subarray-product-less-than-k/submissions

require 'pry-nav'

def num_subarray_product_less_than_k(nums, k)
  left = count = 0
  product = 1
  (0...nums.length).each do |right|
      if nums[right] >= k
          left = right + 1
          product = 1
          next
      end

      product *= nums[right]

      while product >= k
          product /= nums[left]
          left += 1
      end

      count += right - left + 1
  end
  count
end
