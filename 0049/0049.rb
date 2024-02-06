# frozen_string_literal: true

# https://leetcode.com/problems/group-anagrams

# my solution
def group_anagrams(strs)
  res = Hash.new { |hash, key| hash[key] = [] }
  strs.each do |str|
    res[str.chars.tally].push str
  end
  res.values
end

# cool one liner
def group_anagrams(strs)
  strs.group_by { |str| str.each_byte.tally.hash }.values
end
