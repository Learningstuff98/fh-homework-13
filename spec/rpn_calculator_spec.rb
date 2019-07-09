require 'spec_helper'

RSpec.describe RPN, type: :model do
  describe 'evaluate should work' do

    it 'should return 0 for an empty string' do
      rpn = RPN.new("")
      expect(rpn.evaluate).to be 0
    end

    it 'should return 9 for this string' do
      rpn = RPN.new("3 2 1 + *")
      expect(rpn.evaluate).to be 9
    end

    it 'should return 7 for this string' do
      rpn = RPN.new("1 2 3 * +")
      expect(rpn.evaluate).to be 7
    end

    it 'should return 5 for this string' do
      rpn = RPN.new("15 7 1 1 + - / 3 * 2 1 1 + + -")
      expect(rpn.evaluate).to be 5
    end
  end
end