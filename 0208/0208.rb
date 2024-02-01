# frozen_string_literal: true

# https://leetcode.com/problems/implement-trie-prefix-tree/

class Trie
  class Node
    attr_accessor :terminal
    attr_reader :children

    def initialize
      @terminal = false
      @children = {}
    end
  end

  def initialize
    @root = Node.new
  end

=begin
  :type word: String
  :rtype: Void
=end
  def insert(word)
    cur = @root

    word.each_char do |char|
      cur.children[char] = Node.new unless cur.children[char]
      cur = cur.children[char]
    end
    cur.terminal = true
  end


=begin
  :type word: String
  :rtype: Boolean
=end
  def search(word)
    cur = @root

    word.each_char do |char|
      cur = cur.children[char]
      return false unless cur
    end
    cur.terminal
  end


=begin
  :type prefix: String
  :rtype: Boolean
=end
  def starts_with(prefix)
    cur = @root

    prefix.each_char do |char|
      cur = cur.children[char]
      return false unless cur
    end
    true
  end
end
