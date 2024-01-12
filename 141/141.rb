# frozen_string_literal: true

# https://leetcode.com/problems/linked-list-cycle/

def hasCycle(head)
  return false if head.nil? || head.next.nil? || head.next.next.nil?

  tortoise = head.next
  hare = head.next.next

  while tortoise && hare
    return true if tortoise == hare

    tortoise = tortoise.next
    2.times do
      return false if hare.nil?

      hare = hare.next
    end
  end
  false
end
