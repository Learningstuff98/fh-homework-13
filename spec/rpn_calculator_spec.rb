require 'spec_helper'

RSpec.describe RPN, type: :model do

  describe 'build should build a linked list based on this input string:' do

    it '' do
      rpn = RPN.new('')
      stack = rpn.build
      expect(stack.stringify_list(stack.data)).to eq('')
    end

    it '1 2 3 * +' do
      rpn = RPN.new('1 2 3 * +')
      stack = rpn.build
      expect(stack.stringify_list(stack.data)).to eq('1 --> 2 --> 3 --> * --> +')
    end

    it '3 2 1 + *' do
      rpn = RPN.new('3 2 1 + *')
      stack = rpn.build
      expect(stack.stringify_list(stack.data)).to eq('3 --> 2 --> 1 --> + --> *')
    end

    it '15 7 1 1 + - / 3 * 2 1 1 + + -' do
      rpn = RPN.new('15 7 1 1 + - / 3 * 2 1 1 + + -')
      stack = rpn.build
      expect(stack.stringify_list(stack.data)).to eq('15 --> 7 --> 1 --> 1 --> + --> - --> / --> 3 --> * --> 2 --> 1 --> 1 --> + --> + --> -')
    end

  end

  describe 'operator? should' do

    it 'determine if a string plus sign is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('+')).to be true
    end

    it 'determine if a string minus sign is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('-')).to be true
    end

    it 'determine if a string astrix is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('*')).to be true
    end

    it 'determine if a string slash is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('/')).to be true
    end

    it 'determine if a string 3 is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('3')).to be false
    end

    it 'determine if a string 200 is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('200')).to be false
    end

    it 'determine if a string 10 is an operator or not' do
      rpn = RPN.new("")
      expect(rpn.operator?('10')).to be false
    end

  end

  describe 'evaluate' do

    it 'should return 0 for an empty string' do
      rpn = RPN.new("")
      expect(rpn.evaluate).to be 0
    end

    it 'should return 3 for: 1 2 +' do 
      rpn = RPN.new("1 2 +")
      expect(rpn.evaluate).to be 3
    end

    it 'should return 9 for: 3 2 1 + *' do
      rpn = RPN.new("3 2 1 + *")
      expect(rpn.evaluate).to be 9
    end

    it 'should return 7 for: 1 2 3 * +' do
      rpn = RPN.new("1 2 3 * +")
      expect(rpn.evaluate).to be 7
    end

    it 'should return 5 for: 15 7 1 1 + - / 3 * 2 1 1 + + -' do
      rpn = RPN.new("15 7 1 1 + - / 3 * 2 1 1 + + -")
      expect(rpn.evaluate).to be 5
    end
  end
end