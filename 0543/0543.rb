# frozen_string_literal: true

# https://leetcode.com/problems/diameter-of-binary-tree/

def diameter_of_binary_tree(root)
  traverse(root)[1] - 1
end

def traverse(node, diam = 0)
  return [0, diam] if node.nil?

  l, d1 = traverse(node.left, diam)
  r, d2 = traverse(node.right, diam)
  h = [l, r].max
  diam = [d1, d2, l + r + 1].max
  [h + 1, diam]
end

# I think this is more readable tbh

def diameter_of_binary_tree(root)
  max = [0]
  max_depth(root, max)
  max[0]
end

def max_depth(node, max)
  return 0 if node.nil?

  l = max_depth(node.left, max)
  r = max_depth(node.right, max)
  max[0] = [max[0], l + r].max
  [l, r].max + 1
end
