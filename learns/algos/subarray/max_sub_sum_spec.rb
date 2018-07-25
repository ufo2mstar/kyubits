require 'rspec'
require_relative 'max_sub_sum'

describe "max_sub_sum" do
  context "kadane check" do
    it 'sums mixed valid arys' do
      ary = [-2, -3, 4, -1, -2, 1, 5, -3]
      res = mss_kadane ary
      expect(res).to eq 7
    end
    it 'sums mixed valid arys' do
      ary = [-2, -3, 4, -1, -2, 1, 5, -3, 4]
      res = mss_kadane ary
      expect(res).to eq 8
    end
  end
end
