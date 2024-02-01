# frozen_string_literal: true

# https://leetcode.com/problems/set-mismatch/description

# Solution using Set
def find_error_nums(nums)
  repeated = missing = nil
  s = Set.new
  nums.each do |num|
    if s.include?(num)
      repeated = num
    else
      s << num
    end
  end

  (1..nums.length).each do |i|
    unless s.include?(i)
      missing = i
      break
    end
  end
  [repeated, missing]
end

# Math Solution
def find_error_nums(nums)
  n = nums.length
  arr = Array.new(n, false)
  dup = nil
  sum = 0
  nums.each do |num|
    if arr[num - 1]
      dup = num
    else
      arr[num - 1] = true
      sum += num
    end
  end

  expected = (n * (n + 1)) / 2
  [dup, expected - sum]
end

# Evil bitshift solution
def find_error_nums(nums)
  n = nums.length

  xor_arr = nums.reduce(0) { _1 ^ _2 }
  xor_all = (1..n).to_a.reduce(0) { _1 ^ _2 }

  xor_res = xor_arr ^ xor_all

  rightmost_bit = xor_res & -xor_res

  xor_set = 0
  xor_not_set = 0

  (1..n).each do |i|
    if i & rightmost_bit != 0
      xor_set ^= i
    else
      xor_not_set ^= i
    end
  end

  nums.each do |num|
    if num & rightmost_bit != 0
      xor_set ^= num
    else
      xor_not_set ^= num
    end
  end

  nums.each do |num|
    return [xor_set, xor_not_set] if num == xor_set
  end

  [xor_not_set, xor_set]

end
