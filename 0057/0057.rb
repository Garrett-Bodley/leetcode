# frozen_string_literal: true

# https://leetcode.com/problems/insert-interval/description/

# this one was rather tricky

def insert(intervals, new_interval)
  if intervals.empty?
    intervals << new_interval
    return intervals
  end

  if intervals.length == 1
    new_interval[0] > intervals[0][0] ? intervals << new_interval : intervals.unshift(new_interval)
    merge_behind(intervals, 1) if overlap?(intervals[0], intervals[1])
  else
    i = binary_insert_search(intervals, new_interval)
    puts i
    intervals.insert(i, new_interval)

    while i - 1 >= 0 && overlap?(intervals[i], intervals[i - 1])
      merge_behind(intervals, i)
      i -= 1
    end
    merge_ahead(intervals, i) while i + 1 < intervals.length && overlap?(intervals[i], intervals[i + 1])
  end
  intervals
end

def overlap?(i1, i2)
  i1[0] <= i2[1] && i2[0] <= i1[1]
end

def merge_behind(intervals, i)
  s = [intervals[i - 1][0], intervals[i][0]].min
  f = [intervals[i - 1][1], intervals[i][1]].max
  new_interval = [s, f]
  intervals[i] = new_interval
  intervals.slice!(i - 1)
end

def merge_ahead(intervals, i)
  s = [intervals[i][0], intervals[i + 1][0]].min
  f = [intervals[i][1], intervals[i + 1][1]].max
  new_interval = [s, f]
  intervals[i] = new_interval
  intervals.slice!(i + 1)
end

def binary_insert_search(intervals, new_interval)
  start = new_interval[0]
  i = 0
  j = intervals.length - 1

  while i <= j
    mid = (i + j) / 2
    if start == intervals[mid][0]
      return mid
    elsif start < intervals[mid][0]
      j = mid - 1
    elsif start > intervals[mid][0]
      i = mid + 1
    end
  end
  i
end

intervals = [[1,5]]
new_interval = [2,3]

insert(intervals, new_interval)
