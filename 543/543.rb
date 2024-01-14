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
