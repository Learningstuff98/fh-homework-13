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

end
