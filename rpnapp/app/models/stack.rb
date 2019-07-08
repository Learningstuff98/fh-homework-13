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
    last = @data
    @data = @data.next_node
    last
  end
end
