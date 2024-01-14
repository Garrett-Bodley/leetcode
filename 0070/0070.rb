# frozen_string_literal: true

# https://leetcode.com/problems/climbing-stairs

# build the whole dp array
def climb_stairs(n)
  return n if n < 3

  ways = [1, 2]
  (2...n).each do |i|
    ways[i] = ways[i - 1] + ways[i - 2]
  end
  ways[-1]
end

# only two variables
def climb_stairs(n)
  return n if n < 3

  more_prev = 1
  prev = 2
  (2...n).each do
    prev, more_prev = prev + more_prev, prev
  end
  prev
end
