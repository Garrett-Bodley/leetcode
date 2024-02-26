# frozen_string_literal: true

# https://leetcode.com/problems/same-tree/description

require 'pry-nav'

def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if (!p && q) || (p && !q) || (p.val != q.val)

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end
