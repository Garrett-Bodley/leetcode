# frozen_string_literal: true

# https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue
  def initialize()
    @s1 = []
      @s2 = []
  end


=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @s1 << x
  end


=begin
  :rtype: Integer
=end
  def pop()
    return @s2.pop unless @s2.empty?

      until @s1.empty?
        @s2 << @s1.pop
      end

      @s2.pop
  end


=begin
  :rtype: Integer
=end
  def peek()
    return @s2[-1] unless @s2.empty?

      until @s1.empty?
        @s2 << @s1.pop
      end

      @s2[-1]
  end


=begin
  :rtype: Boolean
=end
  def empty()
    @s2.empty? && @s1.empty?
  end


end
