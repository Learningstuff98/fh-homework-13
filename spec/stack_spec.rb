require 'spec_helper'

RSpec.describe Stack, type: :model do
  describe 'stringify_list method should work' do

    it 'for these numbers: 12 --> 99 --> 37' do 
      node1 = Node.new(37)
      node2 = Node.new(99, node1)
      node3 = Node.new(12, node2)
      stack = Stack.new
      expect(stack.stringify_list(node3)).to eq("12 --> 99 --> 37")
    end

    it 'for these numbers: 120 --> 10 --> 12 --> 99 --> 37' do 
      node1 = Node.new(37)
      node2 = Node.new(99, node1)
      node3 = Node.new(12, node2)
      node4 = Node.new(10, node3)
      node5 = Node.new(120, node4)
      stack = Stack.new
      expect(stack.stringify_list(node5)).to eq("120 --> 10 --> 12 --> 99 --> 37")
    end

  end

  describe 'Push method should work' do

    it 'for just a single value: 8' do
      stack = Stack.new
      stack.push(8)
      expect(stack.stringify_list(stack.data)).to eq("8")
    end

    it 'for more than one value: 12, 99, 37, 8' do
      stack = Stack.new
      stack.push(8)
      stack.push(37)
      stack.push(99)
      stack.push(12)
      expect(stack.stringify_list(stack.data)).to eq("12 --> 99 --> 37 --> 8")
    end
  end

  describe "Pop method should work" do

    it 'for removing a single node from a list of multiple nodes and returning it' do
      stack = Stack.new
      stack.push(8)
      stack.push(37)
      stack.push(99)
      stack.push(12)
      return_node = stack.pop
      expect(stack.stringify_list(stack.data)).to eq("99 --> 37 --> 8")
      expect(return_node.value).to be 12
    end

    it 'for removing a single node from a list with only one node and returning it' do
      stack = Stack.new
      stack.push(8)
      return_node = stack.pop
      expect(stack.stringify_list(stack.data)).to eq("")
      expect(return_node.value).to be 8
    end

  end

end
