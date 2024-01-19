# frozen_string_literal: true

# https://leetcode.com/problems/minimum-falling-path-sum

# Idiomatic ruby solution
def min_falling_path_sum(matrix)
  dp = matrix[0].dup

  (1...matrix.length).each do |y|
    new_dp = []
    (0...matrix[0].length).each do |x|
      neighbors = [-1, 0, 1].map do |x_offset|
        new_x = x + x_offset
        if (0...matrix[0].length).cover?(new_x)
          dp[new_x]
        else
          nil
        end
      end.compact
      new_dp[x] = neighbors.min + matrix[y][x]
    end
    dp = new_dp
  end

  dp.min
end

# Faster solution
def min_falling_path_sum(matrix)
  n = matrix.length
  dp = matrix[0].dup

  (1...n).each do |y|
    new_dp = Array.new(n)
    (0...n).each do |x|
      new_dp[x] = dp[x]
      new_dp[x] = [new_dp[x], dp[x - 1]].min if x > 0
      new_dp[x] = [new_dp[x], dp[x + 1]].min if x < n - 1
      new_dp[x] += matrix[y][x]
    end
    dp = new_dp
  end
  dp.min
end

puts min_falling_path_sum([[2,1,3],[6,5,4],[7,8,9]])
