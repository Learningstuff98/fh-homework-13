require 'spec_helper'

RSpec.describe Stack, type: :model do
  describe 'print_values method should work' do
    it 'should work' do 
      node1 = Node.new(37)
      node2 = Node.new(99, node1)
      node3 = Node.new(12, node2)
      stack = Stack.new
      expect(stack.print_values(node3)).to eq("12 --> 99 --> 37 --> ")
    end
  end
end
