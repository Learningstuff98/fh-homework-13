require_relative 'stack'
require_relative 'numeric'

class Rpn < ApplicationRecord

  def evaluate(string)
    return 0 if string == ""
    string = string.split(' ')
    stack = Stack.new
    i = 0
    while i < string.length
      if string[i].numeric?
        stack.push(string[i])
      else
        operand1 = stack.pop.value.to_i
        operand2 = stack.pop.value.to_i
        if string[i] == '+'
          stack.push(operand1 + operand2)
        elsif string[i] == '-'
          stack.push(operand2 - operand1)
        elsif string[i] == 'x'
          stack.push(operand1 * operand2)
        elsif string[i] == '/'
          stack.push(operand2 / operand1)
        end
      end
      i += 1
    end
    stack.pop.value
  end

end
