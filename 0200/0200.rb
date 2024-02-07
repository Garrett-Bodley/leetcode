# frozen_string_literal: true

# LINK GOES HERE

# Slow for unclear reasons

def num_islands(grid)
  @count = 0
  visited = Set.new
  n = grid[0].length
  m = grid.length
  grid.each_with_index do |row, y|
    row.each_with_index do |val, x|
      explore_island(x, y, grid, n, m, visited) unless val == '0' || visited.include?([x, y])
    end
  end
  @count
end

def explore_island(x, y, grid, n, m, visited)
  offsets = [[-1, 0], [1, 0],[0, -1], [0, 1]]
  @count += 1
  queue = [[x, y]]
  until queue.empty?
    cur_x, cur_y = queue.shift

    next if visited.include?([cur_x, cur_y])
    visited << [cur_x, cur_y]

    neighbors = offsets.map do |x_offset, y_offset|
      new_x = cur_x + x_offset
      new_y = cur_y + y_offset
      if (0...n).cover?(new_x) && (0...m).cover?(new_y) && !visited.include?([new_x, new_y]) && grid[new_y][new_x] == '1'
        [new_x, new_y]
      else
        nil
      end
    end

    queue += neighbors.compact
  end
end

# I though a stack would be faster? But it's just as bad tbh

def num_islands(grid)
  @count = 0
  visited = Set.new
  n = grid[0].length
  m = grid.length
  grid.each_with_index do |row, y|
    row.each_with_index do |val, x|
      explore_island(x, y, grid, n, m, visited) unless val == '0' || visited.include?([x, y])
    end
  end
  @count
end

def explore_island(x, y, grid, n, m, visited)
  offsets = [[-1, 0], [1, 0],[0, -1], [0, 1]]
  @count += 1
  stack = [[x, y]]
  until stack.empty?
    cur_x, cur_y = stack.pop

    next if visited.include?([cur_x, cur_y])
    visited << [cur_x, cur_y]

    neighbors = offsets.map do |x_offset, y_offset|
      new_x = cur_x + x_offset
      new_y = cur_y + y_offset
      if (0...n).cover?(new_x) && (0...m).cover?(new_y) && !visited.include?([new_x, new_y]) && grid[new_y][new_x] == '1'
        [new_x, new_y]
      else
        nil
      end
    end

    stack += neighbors.compact
  end
end

# Mutating the original grid is a slightly faster than a Set?

def num_islands(grid)
  @count = 0
  n = grid[0].length
  m = grid.length
  grid.each_with_index do |row, y|
    row.each_with_index do |val, x|
      explore_island(x, y, grid, n, m) unless val == '0'
    end
  end
  @count
end

def explore_island(x, y, grid, n, m)
  offsets = [[-1, 0], [1, 0],[0, -1], [0, 1]]
  @count += 1
  stack = [[x, y]]
  until stack.empty?
    cur_x, cur_y = stack.pop

    neighbors = offsets.map do |x_offset, y_offset|
      new_x = cur_x + x_offset
      new_y = cur_y + y_offset
      if (0...n).cover?(new_x) && (0...m).cover?(new_y) && grid[new_y][new_x] == '1'
        [new_x, new_y]
      else
        nil
      end
    end

    neighbors.compact.each do |neighbor|
      n_x, n_y = neighbor
      grid[n_y][n_x] = '0'
      stack << neighbor
    end
  end
end

# It doesn't make any sense why this is faster tbh

def num_islands(grid)
  count = 0
  n = grid[0].length
  m = grid.length
  grid.each_with_index do |row, y|
    row.each_with_index do |val, x|
      count += explore_island(x, y, n, m, grid) unless val == '0'
    end
  end
  count
end

def explore_island(x, y, n, m, grid)
  if x < 0 || x >= n || y < 0 || y >= m || grid[y][x] != '1'
    return 0
  end

  grid[y][x] = '0'

  explore_island(x + 1, y, n, m, grid)
  explore_island(x - 1, y, n, m, grid)
  explore_island(x, y + 1, n, m, grid)
  explore_island(x, y - 1, n, m, grid)

  1
end
