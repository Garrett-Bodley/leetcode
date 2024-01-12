# frozen_string_literal: true
require 'pry-nav'

# https://leetcode.com/problems/flood-fill/

class Solver
  Coord = Struct.new(*%i[x y])

  def initialize(image, y, x, color)
    @start = Coord.new(x, y)
    @image = image
    @color = color
  end

  def north(coord)
    return nil if coord.y == 0

    Coord.new(coord.x, coord.y - 1)
  end

  def south(coord)
    return nil if coord.y == @image.length - 1

    Coord.new(coord.x, coord.y + 1)
  end

  def east(coord)
    return nil if coord.x == @image[0].length - 1

    Coord.new(coord.x + 1, coord.y)
  end

  def west(coord)
    return nil if coord.x == 0

    Coord.new(coord.x - 1, coord.y)
  end

  def get_neighbors(coord)
    [north(coord), south(coord), east(coord), west(coord)].compact
  end

  def solve
    q = [@start]
    visited = Set.new
    visited << @start
    replace = @image[@start.y][@start.x]

    until q.empty?
      cur = q.shift
      visited << cur
      @image[cur.y][cur.x] = @color
      neighbors = get_neighbors(cur).reject { visited.include?(_1) || @image[_1.y][_1.x] != replace }
      q += neighbors
    end
    @image
  end
end

def flood_fill(image, y, x, color)
  Solver.new(image, y, x, color).solve
end

flood_fill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
