# frozen_string_literal: true

# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

def lowest_common_ancestor(root, p, q)
  if p .val < q.val
    left = p
    right = q
  else
    left = q
    right = p
  end

  while root
    root = root.right if root.val < left.val
    root = root.left if root.val > right.val
    return root if root.val >= left.val && root.val <= right.val

  end
end
