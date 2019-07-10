require_relative 'stack'

class RPN
  def initialize(string)
    @string = string
    @stack = Stack.new
    @numbers = []
  end

  # def evaluate
  #   return 0 if @string == ""
  #   build.each do |num_or_operator|
  #     calculation(num_or_operator)
  #   end
  #   @stack.pop.value
  # end

  # def calculation(num_or_operator)
  #   if operator?(num_or_operator)
  #     operand1 = @stack.pop.value.to_i
  #     operand2 = @stack.pop.value.to_i
  #     @stack.push(operand2.send(num_or_operator, operand1))
  #   else
  #     @stack.push(num_or_operator)
  #   end
  # end

  # def build
  #   @string.split(' ')
  # end

  def evaluate
    return 0 if @string == ""
    build
    current = @stack.data
    while current
      calculation(current)
      current = current.next_node
    end
    @numbers.pop
  end

  def calculation(node)
    if operator?(node.value)
      operand1 = @numbers.pop
      operand2 = @numbers.pop
      @numbers.push(operand2.send(node.value, operand1))
    else
      @numbers.push(node.value)
    end
  end

  def build
    char_array = @string.split(' ').reverse
    char_array.each do |char|
      if operator?(char)
        @stack.push(char)
      else
        @stack.push(char.to_i)
      end
    end
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
