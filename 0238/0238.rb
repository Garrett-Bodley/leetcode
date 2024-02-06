# frozen_string_literal: true

# https://leetcode.com/problems/product-of-array-except-self/description/

def product_except_self(nums)
  zero_idx = -1
  product = 1
  nums.each_with_index do |num, idx|
    if num.zero?
      return Array.new(nums.length, 0) unless zero_idx.negative?

      zero_idx = idx
    else
      product *= num
    end
  end

  if zero_idx.negative?
    nums.map { |num| product / num }
  else
    nums.map do |_num, idx|
      idx == zero_idx ? product : 0
    end
  end
end

puts product_except_self([1,2,3,4]).to_s
