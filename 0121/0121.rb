# frozen_string_literal: true

# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

def max_profit(p)
  min = Float::INFINITY
  profit = -Float::INFINITY
  p.each do |val|
    min = [min, val].min
    profit = [profit, val - min].max
  end
  profit
end

input = [7, 1, 5, 3, 6, 4]

puts max_profit(input)
