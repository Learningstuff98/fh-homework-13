require_relative 'stack'

class RPN
  def initialize(string)
    @string = string
    @stack = Stack.new
    @build = build
  end

  # def evaluate
  #   return 0 if @string == ''
  #   build
  #   current = @stack.data
  #   while current
  #     calculation(current)
  #     current = current.next_node
  #   end
  #   @stack.pop.value
  # end

  #Ask Conrad if there's a better way to handle what I had to do on line 7.
  def evaluate(current = @stack.data)
    return 0 if @string == ''

    if current
      calculation(current)
      current = current.next_node
      evaluate(current)
    else
      @stack.pop.value
    end
  end

  def calculation(node)
    if !operator?(node.value)
      @stack.push(node.value)
    else
      operand1 = @stack.pop.value
      operand2 = @stack.pop.value
      @stack.push(operand2.send(node.value, operand1))
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

  # def string_to_integer(string_num)
    
  # end

end
