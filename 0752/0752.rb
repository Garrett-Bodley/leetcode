# frozen_string_literal: true

# https://leetcode.com/problems/open-the-lock/description

require 'pry-nav'
require 'algorithms'

Node = Struct.new(*%i[lock distance]) do
  def to_s
    lock.join.rjust(4, '0')
  end
end

def open_lock(deadends, target)
  return -1 if deadends.include?('0000')

  lock = [0] * 4
  root = Node.new(lock, 0)
  visited = Set.new
  visited << root.to_s

  deadends.each do |deadend|
    visited << deadend
  end

  q = Queue.new
  q << root

  until q.empty?
    cur = q.pop
    return cur.distance if cur.to_s == target

    4.times do |i|
      decrement_combo = update_combo(cur.lock.dup, i, -1)
      increment_combo = update_combo(cur.lock.dup, i, 1)

      decrement_node = Node.new(decrement_combo, cur.distance + 1)
      increment_node = Node.new(increment_combo, cur.distance + 1)

      unless visited.include?(decrement_node.to_s)
        visited << decrement_node.to_s
        q << decrement_node
      end
      unless visited.include?(increment_node.to_s)
        visited << increment_node.to_s
        q << increment_node
      end
    end
  end
  -1
end

def update_combo(combo, index, adjust)
  combo[index] = (combo[index] + adjust) % 10
  combo
end

# def lock_to_s(lock)
#   lock.join.rjust(4, '0')
# end

tests = [
  [['0201', '0101', '0102', '1212', '2002'], '0202', 6],
  [['8888'], '0009', 1],
  [["8887","8889","8878","8898","8788","8988","7888","9888"], '8888', -1],
  [['0000'], '8888', -1]
]

tests.each_with_index do |(deadends, target, expected), idx|
  res = open_lock(deadends, target)
  if res == expected
    puts "Success! #{idx + 1}: got #{expected}"
  else
    puts "Failure :( #{idx + 1}: Expected #{expected}, got #{res}"
  end
end

# p open_lock(tests[0][0], tests[0][1])
