# frozen_string_literal: true

# LINK GOES HERE

require 'pry-nav'

def oranges_rotting(grid)
  m = grid[0].length
  n = grid.length
  q = find_rotten(grid)
  visited = Set.new
  global_t = 0

  q.each do |coord|
    visited << coord
  end

  until q.empty?
    cur = q.shift
    cur_x, cur_y, cur_t = cur
    puts cur if cur_t.nil?
    global_t = [global_t, cur_t].max

    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |x_offset, y_offset|
      new_x = cur_x + x_offset
      new_y = cur_y + y_offset
      new_t = cur_t + 1
      next unless valid_coord?(new_x, new_y, m, n, grid, visited)

      visited << [new_x, new_y]
      grid[new_y][new_x] = 2
      q << [new_x, new_y, new_t]
    end
  end

  has_fresh?(grid) ? -1 : global_t
end

def has_fresh?(grid)
  grid.each do |row|
    row.each do |cell|
      return true if cell == 1
    end
  end
  false
end

def valid_coord?(x, y, m, n, grid, visited)
  x >= 0 && x < m && y >= 0 && y < n && grid[y][x] == 1 && !visited.include?([x, y])
end

def find_rotten(grid)
  res = []
  grid.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      res << [x, y, 0] if cell == 2
    end
  end
  res
end

oranges_rotting([[2,1,1],[1,1,0],[0,1,1]])
