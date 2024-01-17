# frozen_string_literal: true

# https://leetcode.com/problems/01-matrix/

class Solver
  def initialize(matrix)
    @matrix = matrix
    @res = Array.new(matrix.length).map { Array.new(matrix[0].length, Float::INFINITY) }
  end

  def find_zeros
    @matrix.map.with_index do |row, y|
      row.map.with_index do |el, x|
        [x, y, 0] if el.zero?
      end
    end.flatten(1).compact
  end

  def solve
    q = find_zeros
    visited = Set.new
    until q.empty?
      cur = q.shift
      next if visited.include?([cur[0], cur[1]])

      visited << [cur[0], cur[1]]
      @res[cur[1]][cur[0]] = cur[2]

      [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |x_offset, y_offset|
        new_x = cur[0] + x_offset
        new_y = cur[1] + y_offset
        next if new_x < 0 || new_x >= @matrix[0].length || new_y < 0 || new_y >= @matrix.length

        q << [new_x, new_y, cur[2] + 1]
      end
    end
    @res
  end

  def dp_solve
    (0...@matrix.length).each do |y|
      (0...@matrix[0].length).each do |x|
        if @matrix[y][x] != 0
          top = y > 0 ? @res[y - 1][x] : Float::INFINITY
          left = x > 0 ? @res[y][x - 1] : Float::INFINITY
          @res[y][x] = [top, left].min + 1
        else
          @res[y][x] = 0
        end
      end
    end

    (0...@matrix.length).reverse_each do |y|
      (0...@matrix[0].length).reverse_each do |x|
        right = x < @res[0].length - 1 ? @res[y][x + 1] : Float::INFINITY
        down = y < @res.length - 1 ? @res[y + 1][x] : Float::INFINITY
        @res[y][x] = [@res[y][x], [right, down].min + 1].min
      end
    end
    @res
  end
end

def update_matrix(mat)
  s = Solver.new(mat)
  s.dp_solve
end

update_matrix([[0,0,0],[0,1,0],[0,0,0]])
