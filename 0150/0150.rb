# frozen_string_literal: true

# https://leetcode.com/problems/evaluate-reverse-polish-notation

def eval_rpn(tokens)
  stack = []

  tokens.each do |token|
    case token
    when '+'
      a, b = stack.pop(2)
      stack.push(a + b)
    when '-'
      a, b = stack.pop(2)
      stack.push(a - b)
    when '*'
      a, b = stack.pop(2)
      stack.push(a * b)
    when '/'
      a, b = stack.pop(2)
      stack.push((a / b.to_f).to_i)
    else
      stack.push(token.to_i)
    end
  end
  stack.pop.to_i
end
