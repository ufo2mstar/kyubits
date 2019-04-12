require 'rspec'
require_relative 'palindrome_rec'

def palin_check str, exp
  res = is_palin str
  expect(res).to eq exp
end

describe "palindrome_rec" do
  context "palins" do
    it 'bob' do
      palin_check 'bob', true
    end
  end
  context "non-palins" do
    it 'box' do
      palin_check 'box', false
    end
  end
  context "edge cases" do

  end
end
