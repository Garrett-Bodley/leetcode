# frozen_string_literal: true

# https://leetcode.com/problems/largest-divisible-subset

require 'pry-nav'

def largest_divisible_subset(nums)
  nums.sort!
  dp = {}
  res = []
  nums.length.times do |i|
    tmp = dfs(i, nums, dp)
    res = tmp if tmp.length > res.length
  end
  res
end

def dfs(i, nums, dp)
  return [] if i == nums.length
  return dp[i] if dp[i]

  res = [nums[i]]
  (i + 1...nums.length).each do |j|
    if nums[j] % nums[i] == 0
      tmp = [nums[i]] + dfs(j, nums, dp)
      res = tmp if tmp.length > res.length
    end
  end
  dp[i] = res
end

largest_divisible_subset([1,2,3])
