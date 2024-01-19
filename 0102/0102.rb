# frozen_string_literal: true

# https://leetcode.com/problems/binary-tree-level-order-traversal/

def level_order(root)
  return [] if root.nil?

  res = []
  frontier = [root]
  until frontier.empty?
    res << frontier.map(&:val)
    frontier = frontier.map do |node|
      [node.left, node.right]
    end.flatten.compact
  end
  res
end

root = [3,9,20,nil,nil,15,7]

TreeNode = Struct.new(*%i[val left right]) do
  def initialize(value, left = nil, right = nil)
    super(value, left, right)
  end
end

def make_tree(arr)
  root = TreeNode.new(arr[0])
  q = [root]
  i = 1

  while i < arr.length
    node = q.shift
    if arr[i]
      node.left = TreeNode.new(arr[i])
      q << node.left
    end
    i += 1

    next if i >= arr.length

    if arr[i]
      node.right = TreeNode.new(arr[i])
      q << node.right
    end
    i += 1
  end
  root
end

puts level_order(make_tree(root)).to_s
