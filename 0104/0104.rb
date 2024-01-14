# frozen_string_literal: true

# https://leetcode.com/problems/maximum-depth-of-binary-tree/

def max_depth(root)
  return 0 if root.nil?

  l = max_depth(root.left)
  r = max_depth(root.right)
  [l, r].max + 1
end
