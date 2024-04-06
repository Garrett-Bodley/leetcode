# frozen_string_literal: true

# https://leetcode.com/problems/make-the-string-great/description/

require 'pry-nav'

def make_good(s)
  stack = []
  s.each_char do |char|
    if !stack.empty? && (stack[-1].ord - char.ord).abs == 32
      stack.pop
      next
    end
    stack << char
  end
  stack.join
end

puts make_good('abBAcC')
