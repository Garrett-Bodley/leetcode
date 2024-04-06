# frozen_string_literal: true

# LINK GOES HERE

require 'pry-nav'

def max_subarray_length(nums, k)
  hash = Hash.new { |hash, key| hash[key] = 0 }
  left = right = 0
  max = -Float::INFINITY
  while right < nums.length
      hash[nums[right]] += 1

      while hash[nums[right]] > k
          hash[nums[left]] -= 1
          left += 1
      end
      max = [max, right - left + 1].max
      right += 1
  end

  max
end
