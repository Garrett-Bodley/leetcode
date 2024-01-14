# frozen_string_literal: true

# https://leetcode.com/problems/invert-binary-tree

def invert_tree(root)
  q = [root]
  until q.empty?
    cur = q.shift
    next if cur.nil?

    tmp = cur.left
    cur.left = cur.right
    cur.right = tmp
    q << cur.left
    q << cur.right
  end
  root
end
