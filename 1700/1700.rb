# frozen_string_literal: true

# https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/description/

require 'pry-nav'

def count_students(students, sandwiches)
  count = students.tally.tap { _1.default = 0 }
  sandwiches.each do |sandwich|
      break if count[sandwich].zero?
      count[sandwich] -= 1
  end
  count.values.sum
end
