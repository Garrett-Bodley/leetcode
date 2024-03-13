# frozen_string_literal: true

# https://leetcode.com/problems/find-the-pivot-integer

require 'pry-nav'

# Non math solution
def pivot_integer(n)
  return n if n == 1

  prefix = [1]
  (1...n).each do |i|
    prefix[i] = prefix[i - 1] + i + 1
  end
  pivot = prefix.each_with_index.find_index do |el, idx|
    el == prefix[-1] - prefix[idx - 1]
  end
  pivot.nil? ? -1 : pivot + 1
end

# Binary Search + some math

def pivot_integer(n)
  return n if n == 1

  @memo = {}
  left = 1
  right = n

  while left < right
    mid = (left + right) / 2 + 1
    return mid if sum(mid) == sum(n) - sum(mid - 1)

    if sum(mid) < sum(n) - sum(mid - 1)
      left = mid
    else
      right = mid - 1
    end
  end
  -1
end

def sum(n)
  return @memo[n] if @memo[n]

  @memo[n] = (n**2 + n) / 2
end

# All Math solution

def pivot_integer(n)
  sum = (n**2 + n) / 2
  x = Integer.sqrt(sum)
  x**2 == sum ? x : -1
end
