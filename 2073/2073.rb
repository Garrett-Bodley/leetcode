# frozen_string_literal: true

# https://leetcode.com/problems/time-needed-to-buy-tickets

require 'pry-nav'

# O(n), do the simulation

def time_required_to_buy(tickets, k)
  i = time = 0
  while true
    if tickets[i].zero?
      i += 1
      i %= tickets.length
      next
    else
      tickets[i] -= 1
      time += 1
      return time if i == k && tickets[i].zero?
      i += 1
      i %= tickets.length
    end
  end
end

# O(n), one pass solution

def time_required_to_buy(tickets, k)
  time = 0
  tickets.length.times do |i|
    if i <= k
      time += [tickets[i], tickets[k]].min
    else
      time += [tickets[i], tickets[k] - 1].min
    end
  end
  time
end
