require 'rspec'
require_relative '2019_rand_yt'

def check n, exp
  res = nth_order_stat arr, n
  expect(res).to eq exp
end

describe "nth order statistic" do
  context "simple test" do
    let(:arr) {[1, 6, 4, 8, 7, 9, 3]}
    it '0th order' do
      n = 0
      exp = nil
      check n, exp
    end
    it '1st order' do
      n = 1
      exp = arr.min
      check n, exp
    end
    it '2nd order' do
      n = 2
      exp = 3
      check n, exp
    end
    it '5th order' do
      n = 5
      exp = 7
      check n, exp
    end
    it 'last order' do
      n = arr.size
      exp = arr.max
      check n, exp
    end
  end
end
