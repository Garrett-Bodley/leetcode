# frozen_string_literal: true

# https://leetcode.com/problems/length-of-last-word/description/

require 'pry-nav'

def length_of_last_word(s)
  s.split.last.length
end
