require 'pry-nav'

class Solver

  def initialize(string, queries)
    @string = string
    @queries = queries
    @prefix = build_prefix_sum(string)
  end

  # Build a data structure such that
  #   prefix[i] = map of character frequences from str[0...i] (excluding i)

  def build_prefix_sum(string)
    prefix = [Array.new(26, 0)]

    (1..string.length).each do |str_idx|
      prefix[str_idx] = prefix[str_idx - 1].dup
      char = string[str_idx - 1]
      ord = char.ord - 'a'.ord
      prefix[str_idx][ord] += 1
    end

    prefix
  end

  def valid?(query) # rubocop:disable Metrics/AbcSize
    left, right, k = query
    sub_s = @string[left..right]
    pre_left = @prefix[left] # everything before left
    pre_right = @prefix[right + 1] # everything up to and including right

    char_map = pre_right.map.with_index do |val, idx|
      val - pre_left[idx]
    end

    odd_count = char_map.select(&:odd?).count
    odd_count -= 1 if sub_s.length.odd?
    odd_count / 2 <= k
  end

  def solve
    @queries.map { valid?(_1) }
  end
end

def can_make_pali_queries(s, queries)
  s = Solver.new(s, queries)
  s.solve
end
