# frozen_string_literal: true

# https://leetcode.com/problems/balanced-binary-tree/description/

def is_balanced(node)
  traverse(node) >= 0
end

def traverse(node, height = 0)
  return height if node.nil?

  left = traverse(node.left, height + 1)
  right = traverse(node.right, height + 1)
  return -1 if left == -1 || right == -1 || (left - right).abs > 1

  [left, right].max
end
