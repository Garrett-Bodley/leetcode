# frozen_string_literal: true

# https://leetcode.com/problems/find-bottom-left-tree-value/description/

require 'pry-nav'

def find_bottom_left_value(root)
  bfs_frontier([root])
end

def bfs_frontier(frontier)
  new_frontier = []
  frontier.each do |node|
    new_frontier << node.left if node.left
    new_frontier << node.right if node.right
  end

  return frontier[0].val if new_frontier.empty?

  bfs_frontier(new_frontier)
end

# have an "frontier" array that holds all the nodes of a specific level
#
# init new_frontier array for next row of nodes
# Iterate through the current frontier
# add child nodes to new_frontier array
# recursively pass the frontier down a function call
# if new_frontier is empty, return leftmost value
