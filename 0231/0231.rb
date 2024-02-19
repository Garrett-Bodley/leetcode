# frozen_string_literal: true

# https://leetcode.com/problems/power-of-two/description/

require 'pry-nav'


def is_power_of_two(n)
  n > 0 && n & n - 1 == 0
end
