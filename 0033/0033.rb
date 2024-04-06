# frozen_string_literal: true

# https://leetcode.com/problems/search-in-rotated-sorted-array

require 'pry-nav'

def search(nums, target)
  if nums[0] < nums[-1] || nums.length == 1
    b_search(0, nums.length - 1, nums, target)
  else
    pivot = find_pivot(nums)
    if nums[-1] < target
      b_search(0, pivot - 1, nums, target)
    else
      b_search(pivot, nums.length - 1, nums, target)
    end
  end
end

def b_search(left, right, nums, target)
  while left <= right
    mid = (left + right) / 2
    return mid if nums[mid] == target

    if nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

def find_pivot(nums)
  left = 0
  right = nums.length - 1
  while left <= right
    return left if nums[left] < nums[right]
    mid = (left + right) / 2
    return mid if nums[mid] < nums[mid - 1] && mid > 0
    if nums[mid] < nums[left]
      right = mid - 1
    else
      left = mid + 1
    end
  end
end


puts search([1,3,5], 5)
