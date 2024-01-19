# frozen_string_literal: true

# https://leetcode.com/problems/clone-graph/

# BFS solution
def cloneGraph(node)
  return node if node.nil?

  visited = Set.new
  new_nodes = {}

  root = Node.new(node.val)
  q = [[node, root]]

  until q.empty?
    node, new_node = q.shift
    next if visited.include?(node)

    visited << node
    neighbors = node.neighbors.reject { visited.include?(_1) }
    next if neighbors.empty?

    q += neighbors.map do |neighbor|
      if new_nodes[neighbor.val]
        new_neighbor = new_nodes[neighbor.val]
      else
        new_neighbor = Node.new(neighbor.val)
        new_nodes[neighbor.val] = new_neighbor
      end
      new_node.neighbors << new_neighbor
      new_neighbor.neighbors << new_node
      [neighbor, new_neighbor]
    end
  end
  root
end

# DFS Solution
def cloneGraph(node)
  @visited ||= {}

  return nil if node.nil?
  return @visited[node] if @visited[node]

  new_node = Node.new(node.val)
  @visited[node] = new_node
  node.neighbors.each do |n|
    clone_n = cloneGraph(n)
    new_node.neighbors << clone_n
  end
  new_node
end
