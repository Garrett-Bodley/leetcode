# frozen_string_literal: true

# https://leetcode.com/problems/remove-nodes-from-linked-list

require 'pry-nav'

Node = Struct.new(*%i[val next])

# Why is this creating a cycle?
def remove_nodes(head)
  stack = []
  cur = head
  while cur
      stack.pop while stack.length > 0 && stack.last < cur.val
      stack << cur.val
      cur = cur.next
  end
  head = head.next while head.val != stack.first

  if stack.length == 1
    head.next = nil
    return head
  end

  stack_ptr = 1
  cur = prev = head
  while cur && stack_ptr < stack.length
    p stack_ptr
    binding.pry
    if cur.val != stack[stack_ptr]
      cur = cur.next
    else
      prev.next = cur
      prev = cur
      cur = cur.next
      stack_ptr += 1
    end
  end

  head
end

# Monotonic stack. remove nodes in reverse
def remove_nodes(head)
  stack = []
  cur = head
  while cur
    stack.pop while stack.length > 0 && stack.last.val < cur.val
    stack << cur
    cur = cur.next
  end
  nxt = nil
  until stack.empty?
    cur = stack.pop
    cur.next = nxt
    nxt = cur
  end
  cur
end

# Just make a new list
def remove_nodes(head)
  stack = []
  cur = head
  while cur
      stack.pop while stack.length > 0 && stack.last < cur.val
      stack << cur.val
      cur = cur.next
  end
  head = head.next while head.val != stack.first

  if stack.length == 1
    head.next = nil
    return head
  end

  dummy = cur = Node.new
  until stack.empty?
    cur.next = Node.new(stack.shift)
    cur = cur.next
  end
  dummy.next
end


# For Testing purposes
dummy = Node.new
nodes = [1,1,1,1]

tmp = dummy
nodes.each do |node|
  tmp.next = Node.new(node)
  tmp = tmp.next
end

res = remove_nodes(dummy.next)

res_arr = []

while res
  res_arr << res.val
  res = res.next
end

p res_arr
