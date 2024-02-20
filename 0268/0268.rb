# frozen_string_literal: true

# https://leetcode.com/problems/missing-number/description/

def missing_number(nums)
  (0..nums.length).to_a.sum - nums.sum
end
