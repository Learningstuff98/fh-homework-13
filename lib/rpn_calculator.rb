require_relative 'stack'

class RPN
  def initialize(string)
    @string = string
    @stack = Stack.new
  end

  def evaluate
    return 0 if @string == ""
    build.each do |element|
      if operator?(element)
        operand1 = @stack.pop.value.to_i
        operand2 = @stack.pop.value.to_i
        @stack.push(operand2.send(element, operand1))
      else
        @stack.push(element)
      end
    end
    @stack.pop.value
  end

  def operator?(operator_string)
    case operator_string
    when '+', '-', '*', '/'
      true
    else
      false
    end
  end

  def build
    char_array = @string.split(' ')
    char_array.each do |char|
      if operator?(char)
        @stack.push(char)
      else
        @stack.push(char.to_i)
      end
    end
  end

end
