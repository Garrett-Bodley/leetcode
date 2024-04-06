# frozen_string_literal: true

# https://leetcode.com/problems/binary-subarrays-with-sum

require 'pry-nav'

# prefix zeros solution magic
def num_subarrays_with_sum(nums, goal)
  left = prefix_zeros = sum = res = 0
  nums.each_with_index do |num, right|
    sum += num
    while left < right and (nums[left].zero? || sum > goal)
      if nums[left] == 1
        prefix_zeros = 0
      else
        prefix_zeros += 1
      end
      sum -= nums[left]
      left += 1
    end
    res += 1 + prefix_zeros if sum == goal
  end
  res
end

# make it into a different question that's asked twice
def num_subarrays_with_sum(nums, goal)
  sliding_window_at_most(nums, goal) - sliding_window_at_most(nums, goal - 1)
end

def sliding_window_at_most(nums, goal)
  left = sum = count = 0
  (0...nums.length).each do |right|
    sum += nums[right]
    while left <= right && sum > goal
      sum -= nums[left]
      left += 1
    end
    count += right - left + 1
  end
  count
end

# IDK what's going on below this. Above solutions work though

# def num_subarrays_with_sum(nums, goal)
#   left = count = 0
#   sum = nums[0]
#   right = 1
#   # is right inclusive
#   while left < right && right <= nums.length
#     if sum > goal
#       sum -= nums[left]
#       left += 1
#     else
#       count += 1 if sum == goal
#       sum += nums[right]
#       right += 1
#     end
#   end

#   # Do we know that left < right? No
#   # Do we know that right == nums.length? Also no
#   #

#   # Can move right?
#   #   yes => move right
#   #   no =>
#   #     can move left?
#   #       yes => move left += 1
#   #       no => what do we do?

# end

def num_subarrays_with_sum(nums, goal)
  left = count = 0
  right = 1
  sum = nums[0]

  while true
    if right < nums.length && (right == left + 1 || sum <= goal)
      right += 1
    elsif
  end
end

def num_subarrays_with_sum(nums, goal)
  # prefix[i] => sum of nums[0] => nums[i - 1]
  prefix = []
  prefix << 0
  nums.each_with_index do |num, idx|
    prefix << num + prefix[idx]
  end

  sum of nums[i...j] = prefix[j] - prefix[i]
end

[
  0, 0, 0, 0, 0, 1, 0, 0, 0,
  0
]

test_inputs = [
  [[1, 0, 1, 0, 1], 2, 4],
  [[0, 0, 0, 0, 0], 0, 15]
].freeze


def test(inputs)
  inputs.each do |nums, goal, expected|
    res = num_subarrays_with_sum(nums, goal)
    puts "Expected: #{expected}, Got: #{res}" if res != expected
  end
end

test(test_inputs)
