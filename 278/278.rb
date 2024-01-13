# frozen_string_literal: true

# https://leetcode.com/problems/first-bad-version/

def first_bad_version(n)
  l = 0
  r = n

  while l < r
    mid = (l + r) / 2

    if is_bad_version(mid)
      r = mid
    else
      l = mid + 1
    end
  end
  l
end

# other implementation

# def first_bad_version(n)
#   l = 0
#   r = n

#   while l <= n
#     mid = l + ((r - l) / 2)
#     if is_bad_version(mid) && is_bad_version(mid + 1)
#       r = mid - 1
#     elsif !is_bad_version(mid) && !is_bad_version(mid + 1)
#       l = mid + 1
#     elsif !is_bad_version(mid) && is_bad_version(mid + 1)
#       return mid + 1
#     end
#   end
#   -1
# end
