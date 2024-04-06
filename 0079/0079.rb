# frozen_string_literal: true

# https://leetcode.com/problems/word-search/description/

require 'pry-nav'

def exist(board, word)
  # TLE if you don't do this
  return false if word.chars.uniq.length > board.flatten.uniq.length

  # Gotcha/trick that makes go from 33% to 87% runtime
  if word.match(/^#{word[0]}+/)[0].size > word.match(/#{word[-1]}+$/)[0].size
    word.reverse!
  end

  board.each_with_index.any? do |row, y|
    row.each_with_index.any? do |char, x|
      next unless char == word[0]
      dfs(x, y, 1, word, board)
    end
  end
end

def dfs(x, y, word_idx, word, board)
  return true if word_idx == word.length
  char = board[y][x]
  board[y][x] = false
  res = [[-1, 0], [1, 0], [0, -1], [0, 1]].any? do |x_offset, y_offset|
    new_x = x + x_offset
    new_y = y + y_offset
    next if new_x < 0 || new_x >= board[0].length
    next if new_y < 0 || new_y >= board.length
    next unless board[new_y][new_x] == word[word_idx]
    dfs(new_x, new_y, word_idx + 1, word, board)
  end
  board[y][x] = char
  return res
end
