# frozen_string_literal: true

# https://leetcode.com/problems/contains-duplicate

def contains_duplicate(nums)
  s = Set.new
  nums.each do |num|
    return true if s.include?(num)

    s << num
  end
  false
end
