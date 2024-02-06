# frozen_string_literal: true

# https://leetcode.com/problems/validate-binary-search-tree/description/

require 'pry-nav'

# slowwww
def is_valid_bst(root)
  traversal = traverse(root).compact
  last = traversal[0]
  puts traversal.to_s
  traversal[1..].each do |num|
    return false if num <= last

    last = num
  end
  true
end

def traverse(node)
  return [nil] if node.nil?

  res = traverse(node.left)
  res.push(node.val)
  [*res, *traverse(node.right)]
end

# faster and eleganter

def is_valid_bst(root, max = Float::INFINITY, min = -Float::INFINITY)
  return true if root.nil?
  return false if root.val >= max || root.val <= min
  return false unless is_valid_bst(root.left, root.val, min)
  return false unless is_valid_bst(root.right, max, root.val)

  true
end
