require_relative 'stack'

class RPN
  def initialize(string)
    @string = string
    @stack = Stack.new
  end

  def evaluate
    return 0 if @string == ""
    build.each do |num_or_operator|
      calculation(num_or_operator)
    end
    @stack.pop.value
  end

  def calculation(num_or_operator)
    if operator?(num_or_operator)
      operand1 = @stack.pop.value.to_i
      operand2 = @stack.pop.value.to_i
      @stack.push(operand2.send(num_or_operator, operand1))
    else
      @stack.push(num_or_operator)
    end
  end

  def build
    @string.split(' ')
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
