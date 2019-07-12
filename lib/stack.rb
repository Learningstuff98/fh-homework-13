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

  def print_values(list_node, value = "")
    if list_node
      print "#{list_node.value} --> "
      value += "#{list_node.value} --> "
      print_values(list_node.next_node, value)
    else
      print "nil\n"
      value
    end
    
  end

end
