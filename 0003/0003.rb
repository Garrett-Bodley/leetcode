# frozen_string_literal: true

# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

# Two implementations of sliding window

# Using a Queue
def length_of_longest_substring(s)
  q = []
  max = 0
  s.each_char do |c|
    index = q.index(c)
    q << c
    (index + 1).times { q.shift } if index
    max = [max, q.length].max
  end
  max
end

# Two Pointers
def length_of_longest_substring(s)
  max = l = r = 0
  chars = {}

  while r < s.length
    cur = s[r]
    l = chars[cur] + 1 if chars[cur] && (l..r).cover?(chars[cur])
    chars[cur] = r
    length = r - l + 1
    max = [max, length].max
    r += 1
  end
  max
end
