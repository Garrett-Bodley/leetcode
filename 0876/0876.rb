# frozen_string_literal: true

# https://leetcode.com/problems/middle-of-the-linked-list/

# tortoise and hare approach
def middle_node(head)
  tortoise = head
  hare = head

  while hare && hare.next # rubocop:disable Style/SafeNavigation
    hare = hare.next.next
    tortoise = tortoise.next
  end
  tortoise
end

# just throw it all in an array approach
def middle_node(head)
  arr = []
  while head
    arr << head
    head = head.next
  end
  arr[arr.length / 2]
end
