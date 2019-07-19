require_relative 'stack'

class RPN
  def initialize(string)
    @string = string
    @stack = Stack.new
    @build = build
  end

  def evaluate
    _evaluate(@stack.data)
  end

  def calculate(node)
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
    if @stack.stringify_list(@stack.data) == '' # prevents the stack from duplicating on itself
      char_array.each do |char|
        if operator?(char)
          @stack.push(char)
        else
          @stack.push(char.to_i)
        end
      end
    end
    @stack
  end

  def operator?(operator_string)
    case operator_string
    when '+', '-', '*', '/'
      true
    else
      false
    end
  end

  private

  def _evaluate(current)
    return 0 if @string == ''

    if current
      calculate(current)
      current = current.next_node
      _evaluate(current)
    else
      @stack.pop.value
    end
  end

end
