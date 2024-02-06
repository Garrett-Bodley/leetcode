# frozen_string_literal: true

# https://leetcode.com/problems/sequential-digits

def sequential_digits(low, high)
  make_sequences.select do |x|
    low <= x && x <= high
  end
end

def make_sequence_n(n)
  seed = %w[1 2 3 4 5 6 7 8 9]

  res = []
  i = 0
  j = i + n
  while j <= seed.length
    res << seed[i...j].join.to_i
    i += 1
    j += 1
  end
  res
end

def make_sequences
  (2..9).to_a.map do |len|
    make_sequence_n(len)
  end.flatten
end


def assert(eval, expected)
  raise "#{eval} != expected: #{expected}" unless eval == expected
  puts 'Success'
end




assert(make_sequence_n(2), [12, 23, 34, 45, 56, 67, 78, 89])
# assert(make_sequences, [1, 2, 3, 4])

assert(sequential_digits(123, 300), [123, 234])
assert(sequential_digits(1000, 13_000), [1234, 2345, 3456, 4567, 5678, 6789, 12345])

# 9

# given 2, return  %w{12 23 34 45 56 67 78 89}

# 123 234 345 456 567 678 789

# 1234 2345 3456 4567 5678 6789

# 12345 23456 34567 45678 56789

# 123456 234567 345678 456789

# 1234567 2345678 3456789

# 12345678 23456789

# 123456789
