# frozen_string_literal: true

# https://leetcode.com/problems/reverse-linked-list

# iterative solution
def reverse_list(head)
  prev = nil
  while head
    tmp = head.next
    head.next = prev
    prev = head
    head = tmp
  end
  prev
end

# recursive solution
def reverse_list(head, prev = nil)
  return prev if head.nil?

  tmp = head.next
  head.next = prev
  reverse_list(tmp, head)
end
