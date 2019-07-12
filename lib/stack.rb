require_relative 'node'

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = Node.new(value, @data)
  end

  def pop
    if @data
      last = @data 
      @data = @data.next_node
      last
    else  
      0
    end
  end

  def stringify_list(list_node, value = "")
    if list_node
      if list_node.next_node
        value += "#{list_node.value} --> "
      else
        value += "#{list_node.value}"
      end
      stringify_list(list_node.next_node, value)
    else
      value
    end
  end

end
