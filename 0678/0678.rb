# frozen_string_literal: true

# https://leetcode.com/problems/valid-parenthesis-string/

require 'pry-nav'

def check_valid_string(s)
  stars = []
  stack = []
  chars = s.chars
  s.chars.each_with_index do |char, idx|
    case char
    when '('
      stack << idx
    when ')'
      if stack.empty?
        return false if stars.empty?
        chars[stars.pop] = '('
      else
        stack.pop
      end
    when '*'
      stars << idx
    end
  end

  until stack.empty?
    return false if stars.empty?

    paren = stack.pop
    star = stars.pop
    return false if star < paren
  end

  true
end
