# frozen_string_literal: true

# https://leetcode.com/problems/minimum-falling-path-sum-ii/description

require 'pry-nav'

def min_falling_path_sum(grid)
  n = grid.length
  return grid[0][0] if n == 1

  dp = grid[0]
  (1...n).each do |i|
    min1, min2 = dp.min(2)
    dp.each_index do |j|
      if dp[j] == min1
        dp[j] = grid[i][j] + min2
      else
        dp[j] = grid[i][j] + min1
      end
    end
  end
  dp.min
end
