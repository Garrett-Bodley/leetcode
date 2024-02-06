# frozen_string_literal: true

# https://leetcode.com/problems/min-stack/

class MinStack
  def initialize
    @stack = []
    @min_stack = []
  end

=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    @min_stack << val if @min_stack.empty? || val <= @min_stack.last
    @stack << val
  end

=begin
  :rtype: Void
=end
  def pop()
    removed = @stack.pop
    @min_stack.pop if @min_stack.last == removed
    removed
  end

=begin
  :rtype: Integer
=end
  def top()
    @stack.last
  end

=begin
  :rtype: Integer
=end
  def get_min()
    @min_stack.last
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
