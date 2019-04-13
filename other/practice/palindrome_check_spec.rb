require 'rspec'
require_relative 'palindrome_check'

def palin_check str, exp
  res = is_palin str
  expect(res).to eq exp
end

describe "palindrome_check" do
  context "palins" do
    it 'odd' do
      palin_check 'bob', true
    end
    it 'even' do
      palin_check 'boob', true
      palin_check 'oo', true
    end
  end
  context "non-palins" do
    it 'odd' do
      palin_check 'box', false
    end
    it 'even' do
      palin_check 'book', false
    end
  end
  context "edge cases" do
    it 'one char' do
      palin_check 'b', true
    end
    it 'no char' do
      palin_check '', true
    end
  end
end
