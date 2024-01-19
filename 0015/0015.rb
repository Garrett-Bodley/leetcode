# frozen_string_literal: true

# https://leetcode.com/problems/3sum/description/

# hash map solution
def three_sum(nums)
  nums.sort!
  nums.delete_at(nums.index(0)) while nums.count(0) > 3

  val_map = {}
  nums.each_with_index do |num, idx|
    val_map[num] = [] if val_map[num].nil?
    val_map[num] << idx
  end
  res = Set.new

  (0...nums.length - 2).each do |i|
    break if nums[i] > 0
    remainder = -nums[i]
    others = two_sum(nums, remainder, i + 1, val_map)
    next if others.empty?

    others.each do |j, k|
      res << [nums[i], nums[j], nums[k]].sort
    end
  end
  res.to_a
end

# find all unique indices where nums[i] + nums[j] == target
def two_sum(nums, target, start, map)
  res = []
  (start...nums.length - 1).each do |i|
    find = target - nums[i]
    if map[find] && map[find].any? { _1 > i }
      k = map[find].find { _1 > i }
      res << [i, k]
    end
  end
  res
end

# ---------------------------------------------
#
# faster two pointers solution

def three_sum(nums)
  nums.sort!
  res = Set.new
  seen = Set.new
  (0...nums.length).each do |i|
    cur = nums[i]
    break if cur.positive?
    next if seen.include?(cur)
    seen << cur
    pairs = two_sum(nums, i + 1, -nums[i])
    next if pairs.empty?

    pairs.each do |j, k|
      next if j == -1
      res << [nums[i], nums[j], nums[k]].sort
    end

  end
  res.to_a
end

def two_sum(nums, start, target)
  res = []
  l = start
  r = nums.length - 1
  while l < r
    if nums[l] + nums[r] == target
      res << [l, r]
      l += 1
    elsif nums[l] + nums[r] < target
      l += 1
    else
      r -= 1
    end
  end
  res
end

# ---------------------------------------------
#
# fastest solution (kind of weird)

def three_sum(nums)
  neg = Set.new
  pos = Set.new

  neg2 = Set.new
  pos2 = Set.new
  zero = 0

  nums.each do |num|
    if num.positive?
      pos2 << num if pos.include?(num)
      pos << num
    elsif num.negative?
      neg2 << num if neg.include?(num)
      neg << num
    else
      zero += 1
    end
  end

  res = []

  res << [0, 0, 0] if zero > 2

  return res if pos.empty? || neg.empty?

  if zero.positive?
    (pos & neg.map(&:-@)).each { res << [-_1, 0, _1]}
  end

  neg_values = neg.to_a.sort.reverse
  pos_values = pos.to_a.sort

  neg_min = neg_values.last
  pos_max = pos_values.last

  (0..neg_values.size - 2).each do |i|
    (i + 1..neg_values.size - 1).each do |j|
      remaining = -(neg_values[i] + neg_values[j])
      break if remaining > pos_max
      res << [neg_values[i], neg_values[j], remaining] if pos.include?(remaining)
    end
  end

  (0..pos_values.size - 2).each do |i|
    (i + 1..pos_values.size - 1).each do |j|
      remaining = -(pos_values[i] + pos_values[j])
      break if remaining < neg_min
      res << [pos_values[i], pos_values[j], remaining] if neg.include?(remaining)
    end
  end

  pos.size > 0 and neg2.to_a.sort.reverse.each do |value|
    remaining = -(value + value)
    break if remaining > pos_max
    res << [value, value, remaining] if pos.include?(remaining)
  end

  neg.size > 0 and pos2.to_a.sort.each do |value|
    remaining = -(value + value)
    break if remaining < neg_min
    res << [value, value, remaining] if neg.include?(remaining)
  end

  res
end

three_sum([-1,0,1,2,-1,-4]).to_s
