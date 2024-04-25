# frozen_string_literal: true

# https://leetcode.com/problems/longest-ideal-subsequence/description

require 'pry-nav'

def longest_ideal_string(s, k)
  dp = Array.new(26, 0)
  res = 1
  s.each_char do |char|
    i = char.ord - 'a'.ord
    dp[i] += 1

    left = [0, i - k].max
    right = [25, i + k].min
    (left..right).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max unless j == i
    end
    res = [res, dp[i]].max
  end
  res
end
