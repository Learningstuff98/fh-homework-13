require_relative 'stack'

class Rpn < ApplicationRecord

  def evaluate(nums_and_operators)
    return 0 if nums_and_operators == ""
    stack = build_stack
    build(nums_and_operators).each do |element|
      if operator?(element)
        operand1 = stack.pop.value.to_i
        operand2 = stack.pop.value.to_i
        stack.push(operand2.send(element, operand1))
      else
        stack.push(element)
      end
    end
    stack.pop.value
  end

  def build_stack
    Stack.new
  end

  def build(string)
    string.split(' ')
  end

  def operator?(operator_string)
    case operator_string
    when '+', '-', '*', '/'
      true
    else
      false
    end
  end

end
