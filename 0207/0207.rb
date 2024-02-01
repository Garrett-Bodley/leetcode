# frozen_string_literal: true

# https://leetcode.com/problems/course-schedule/description/

def can_finish(num_courses, prereq)
  indegree = Array.new(num_courses, 0)
  adj = Array.new(num_courses).map { [] }
  order = []
  source = []

  prereq.each do |a, b|
    # [a, b] means a requires b. B is indegree of a
    indegree[a] += 1
    # b points to a
    adj[b] << a
  end

  indegree.each_with_index do |count, idx|
    source << idx if count == 0
  end

  until source.empty?
    cur = source.shift
    order << cur

    adj[cur].each do |neighbor|
      indegree[neighbor] -= 1
      source << neighbor if indegree[neighbor] == 0
    end
  end

  order.length == num_courses
end
