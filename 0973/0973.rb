# frozen_string_literal: true

# https://leetcode.com/problems/k-closest-points-to-origin/description/

# Sorting solution. Surprisingly faster than heap. Probably bc it offloads work to C?
def k_closest(points, k)
  points.sort_by { |x, y| Math.sqrt(x**2 + y**2) }.first(k)
end

# Heap solution. Slower.
def k_closest(points, k)
  res = []
  h = MinHeap.new
  points.each { |x, y| h.push(x**2 + y**2, [x, y]) }
  k.times { res << h.pop }
  res
end
