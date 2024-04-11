# frozen_string_literal: true

# https://leetcode.com/problems/reveal-cards-in-increasing-order/

require 'pry-nav'

def deck_revealed_increasing(deck)
  deck.sort!.reverse!
  res = []
  deck.each do |card|
    res.unshift(card)
    last = res.pop
    res.unshift(last)
  end
  res.push(res.unshift)
  res
end
