# frozen_string_literal: true

# https://leetcode.com/problems/find-the-town-judge

require 'pry-nav'

# This code is gross and I don't like it
def find_judge(n, trust)
  return n if n == 1 && trust.empty?

  trusted_by = Hash.new(0)
  does_trust = Hash.new
  trust.each do |person, trusts|
    trusted_by[trusts] += 1
    does_trust[person] = true
  end
  potential_judge = trusted_by.to_a.find do |_person, trustcount|
    trustcount == n - 1
  end
  return -1 if potential_judge.nil?

  potential_judge = potential_judge[0]

  does_trust[potential_judge] ? -1 : potential_judge
end

# Better implementation
def find_judge(n, trust)
  trust_arr = Array.new(n + 1, 0)
  trust.each do |person, trusted|
    trust_arr[trusted] += 1
    trust_arr[person] -= 1
  end

  (1..n).each do |idx|
    return idx if trust_arr[idx] == n - 1
  end
  -1
end

# Cursed one liner I found in Solutions tab
def find_judge(n, trust)
  n<2 and 1 or trust.transpose.reverse.reduce(:-).to_a.tally.key n-1 or -1
end

find_judge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]])
