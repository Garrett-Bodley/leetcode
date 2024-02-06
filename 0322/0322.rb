# frozen_string_literal: true

require 'algorithms'
require 'minitest'
require 'pry-nav'

# https://leetcode.com/problems/coin-change/description/

# def coin_change(coins, amount)
#   gmin = [Float::INFINITY]
#   dp(coins.sort { _2 <=> _1 }, amount, gmin) || -1
# end

# def dp(coins, amount, gmin, depth = 0, memo = Hash.new(Float::INFINITY))
#   return nil if amount < 0
#   return nil if depth > gmin[0]
#   return depth if amount == 0
#   return memo[amount] if memo[amount].nil?
#   return memo[amount] if depth >= memo[amount]

#   min = coins.map do |coin|
#     dp(coins, amount - coin, gmin, depth + 1)
#   end.compact.min

#   gmin[0] = min.nil? ? gmin[0] : [min, gmin[0]].min
#   memo[amount] = min
# end

# def coin_change(coins, amount)
#   min = wtf(coins, amount)
#   min == Float::INFINITY ? -1 : min
# end

# def wtf(coins, amount, dp = {})
#   return 0 if amount.zero?
#   return dp[amount] if dp[amount]

#   min = Float::INFINITY
#   coins.each do |coin|
#     new_amount = amount - coin
#     min = [min, wtf(coins, new_amount, dp) + 1].min if new_amount >= 0
#   end

#   dp[amount] = min
# end

# ----

# russ bottom up, double recursion, TLE
# def coin_change(coins, sum)
#   cents_to_coins = {}
#   coins.each { |coin| cents_to_coins[coin] = 1 }
#   cents_to_coins[0] = 0
#   res = min_coins(coins, sum, cents_to_coins)
#   res == Float::INFINITY ? -1 : res
# end


# def min_coins(coins, sum, cents_to_coins = {})
#   return cents_to_coins[sum] if cents_to_coins[sum]

#   res = Float::INFINITY

#   (1...(sum / 2) + 1).each do |x|
#     res = [res, min_coins(coins, x, cents_to_coins) + min_coins(coins, sum - x, cents_to_coins)].min
#   end
#   cents_to_coins[sum] = res
# end

# ----
# bottom up, bounded recursion?

# def coin_change(coins, sum)
#   # cents_to_coins = { 0 => 0 }
#   # coins.each{ |coin| cents_to_coins[coin] = 1 }
#   res = min_coins(coins.sort.reverse, sum, {})
#   res == Float::INFINITY ? -1 : res
# end

# def min_coins(coins, sum, memo)
#   return 0 if sum.zero?
#   return 1 if coins.include?(sum)

#   return memo[sum] if memo[sum]

#   min = Float::INFINITY

#   coins.each do |coin|
#     new_sum = sum - coin
#     min = [min, min_coins(coins, new_sum, memo) + 1].min unless new_sum.negative?
#   end

#   memo[sum] = min
# end

# ----

def coin_change(coins, sum)
  dp = [0] + Array.new(sum, Float::INFINITY)

  (1...dp.length).each do |cents|
    coins.each do |coin|
      dp[cents] = [dp[cents], 1 + dp[cents - coin]].min if cents - coin >= 0
    end
  end

  dp[-1] == Float::INFINITY ? -1 : dp[-1]
end


# def dp(coins, amount, depth = 0, memo = Hash.new(Float::INFINITY))
#   # puts memo.to_s unless memo.empty?

#   return nil if amount < 0

#   if amount == 0
#     return depth
#   end

#   min = coins.map do |coin|
#     new_amount = amount - coin
#     if memo[new_amount] < Float::INFINITY
#       memo[new_amount]
#     else
#       new_count = dp(coins, new_amount, depth + 1, memo)
#       memo[new_amount] = new_count unless new_count.nil? || new_count == -1
#     end
#   end.compact.min

#   if !min.nil? && !min.negative?
#     min
#   else
#     # binding.pry
#     -1
#   end
# end

def assert(eval, expected)
  raise "#{eval} != #{expected}" unless eval == expected
  puts "Success: #{eval}"
end



assert(coin_change([1, 2, 3, 5], 11), 3)

assert(coin_change([1, 2, 3, 5], 10), 2)

assert(coin_change([1, 2, 3, 5], 1), 1)

assert(coin_change([1, 2, 3, 5], 0), 0)

assert(coin_change([2, 3, 5], 1), -1)

assert(coin_change([3, 7, 11], 5), -1)

assert(coin_change([1, 2, 5], 11), 3)

assert(coin_change([1, 2, 5], 30), 6)

assert(coin_change([186, 419, 83, 408], 6249), 20)

assert(coin_change([1, 2, 3, 5], 10**4), 2000)
