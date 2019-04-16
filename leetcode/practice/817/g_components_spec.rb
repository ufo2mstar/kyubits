require 'rspec'
require_relative 'g_components'

require_relative '../../../leetcode/contests/utils/linkedlist'

describe "g_components" do
  context "case 0" do
    it 'simple res' do

      a = [0,1,2,3]
      b = [0,1,3]
      exp = 2

      head = linkedlist_from_ary a

      res = num_components head,b

      expect(res).to eq exp

    end
  end
end

