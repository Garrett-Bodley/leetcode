# frozen_string_literal: true

# https://leetcode.com/problems/odd-even-jump

class Solver
  def initialize(arr)
    @dp = {}
    preprocess(arr)
  end

  def preprocess(arr)
    idxs_by_val = arr.map.with_index { |val, i| [val, i] }.sort { _1[0] <=> _2[0] }.map { _1[1] }
    @even = monotonic_stack(idxs_by_val)

    idxs_by_val_r = arr.map.with_index { |val, i| [val, i] }.sort { _2[0] <=> _1[0] }.map { _1[1] }
    @odd = monotonic_stack(idxs_by_val_r)
  end

  def monotonic_stack(idxs_by_val)
    res = [false] * idxs_by_val.length
    stack = []

    idxs_by_val.each do |i|
      while !!stack[-1] && stack[-1] < i
        res[stack.pop] = i
      end
      stack << i
    end
    res
  end

  def valid_idx?(idx, arr, visited, is_even)
    return false unless idx
    return true if idx == arr.length - 1
    return false if visited[idx]
    return @dp[[idx, is_even]] if @dp[[idx, is_even]]

    visited[idx] = true
    new_idx = is_even ? @even[idx] : @odd[idx]
    res = valid_idx?(new_idx, arr, visited, !is_even)
    @dp[[idx, is_even]] = res
    res
  end
end

def odd_even_jumps(arr)
  s = Solver.new(arr)
  res = 0

  (0...arr.length).each do |i|
    res += 1 if s.valid_idx?(i, arr, {}, true)
  end
  res
end
