require 'rspec'
require_relative 'real_test'

# 12 other tests
describe "demo_01" do
  context "8 houses cases" do
    it '1e41e2' do
      ary = [1, 0, 0, 0, 0, 1, 0, 0]
      days = 1
      res = cellCompete ary, days
      expect(res).to eq [0, 1, 0, 0, 1, 0, 1, 0]
    end
    it '311041' do
      ary = [1, 1, 1, 0, 1, 1, 1, 1]
      days = 2
      res = cellCompete ary, days
      expect(res).to eq [0, 0, 0, 0, 0, 1, 1, 0]
    end
  end
end

# 13 other tests
describe "demo_02" do
  context "gcd ary" do
    it '1' do
      ary = [2,3,4,5,6]
      res = generalizedGCD 0,ary
      expect(res).to eq 1
    end
    it '2' do
      ary = [2,4,6,8,10]
      res = generalizedGCD 0,ary
      expect(res).to eq 2
    end
  end
end
