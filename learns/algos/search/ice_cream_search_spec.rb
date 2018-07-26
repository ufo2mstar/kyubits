require 'rspec'
require_relative 'ice_cream_search'

describe :bin_search_simple do
  context "return -1 for" do
    it 'should empty ary' do
      cost = [1,4,5,3,2]
      money = 4
      res = whatFlavors cost, money
      expect(res).to eq [1,4]
    end
    it 'should empty ary' do
      cost = [2,2,4,3]
      money = 4
      res = whatFlavors cost, money
      expect(res).to eq [1,2]
    end
  end

end
