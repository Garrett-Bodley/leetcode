# frozen_string_literal: true

# https://leetcode.com/problems/minimum-height-trees/description

require 'pry-nav'

# Node = Struct.new(*%i[val neighbors]) do
#   def to_s
#     val
#   end
# end

# this actually works

def find_min_height_trees(n, edges)
  return (0...n).to_a if n < 2

  graph = Array.new(n) { [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end

  leaves = []
  graph.each_with_index do |neighbors, idx|
    leaves << idx if neighbors.length == 1
  end

  remaining = n
  while remaining > 2
    remaining -= leaves.length
    new_leaves = []
    leaves.each do |leaf|
      neighbor = graph[leaf].first
      graph[neighbor].delete(leaf)
      new_leaves << neighbor if graph[neighbor].length == 1
    end
    leaves = new_leaves
  end
  leaves
end

# v what the fuck v

def find_min_height_trees(n, edges)
  return [] if edges.empty?

  graph = Array.new(n) { [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end
  # leaf_node = graph.find { _1.length == 0 }
  first_leaf = find_furthest_node(0, graph)
  second_leaf = find_furthest_node(first_leaf, graph)

  p "first leaf : #{first_leaf}, second leaf: #{second_leaf}"

  frontier = [first_leaf, second_leaf]
  visited = Set.new
  frontier.each { visited << _1 }
  res = []
  while res.empty?
    p graph
    new_frontier = []
    frontier.each do |node_idx|
      p node_idx
      graph[node_idx].each do |new_node|
        if visited.include?(new_node)
          res << new_node
        else
          graph[node_idx] -= [new_node]
          graph[new_node] -= [node_idx] # wut
          new_frontier << new_node
          visited << new_node
        end
      end
      graph[node_idx] = []
    end
    frontier = new_frontier
  end
  res.uniq
end


def find_furthest_node(node_idx, graph)
  # q will contain the nodes value/index in the array
  visited = Set.new
  q = Queue.new
  q << node_idx
  visited << node_idx
  last = nil
  until q.empty?
    cur_idx = q.pop
    # p cur_idx
    last = cur_idx
    graph[cur_idx].each do |neighbor|
      q << neighbor unless visited.include?(neighbor)
      visited << neighbor
    end
  end
  last
end

n = 4
edges = [[1,0],[1,2],[1,3]]

n = 6
edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
p find_min_height_trees(n, edges)


# feels close? But very broken. I hate this problem

def find_min_height_trees(n, edges)
  return [0] if edges.empty?
  return edges[0] if edges.length == 1

  graph = Array.new(n) { [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end
  left = furthest_node(0, graph)
  right = furthest_node(left, graph)

  distance = distance_between(left, right, graph)
  p distance
  leaves = []
  graph.each_with_index do |neighbors, node|
    leaves << node if neighbors.length == 1
  end

  converge(leaves, distance, graph, n)
end

def furthest_node(node, graph)
  visited = Set.new.tap { _1 << node }
  q = Queue.new
  q << node
  last = nil

  until q.empty?
    cur = q.pop
    last = cur
    graph[cur].each do |neighbor|
      next if visited.include?(neighbor)
      visited << neighbor
      q << neighbor
    end
  end

  last
end

def distance_between(source, target, graph)
  q = Queue.new.tap { _1 << [source, 0] }
  visited = Set.new.tap { _1 << source }

  until q.empty?
    cur, distance = q.pop
    graph[cur].each do |neighbor|
      next if visited.include?(neighbor)
      return distance + 1 if neighbor == target

      visited << neighbor
      q << [neighbor, distance + 1]
    end
  end
  -1
end

def converge(leaves, distance, graph, n)
  nodes = (0...n).to_set
  q = Queue.new
  leaves.each do |leaf|
    nodes.delete(leaf)
    q << leaf
  end

  (distance/2 - 1).times do
    new_leaves = []
    leaves.each do |leaf|
      nodes.delete(leaf)
      graph[leaf].each do |neighbor|
        next unless nodes.include?(neighbor)
        new_leaves << neighbor
        nodes.delete(neighbor)
      end
    end
    leaves = new_leaves
  end
  nodes.to_a
end
