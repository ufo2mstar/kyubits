require 'rspec'
require_relative 'group_anags'

describe "anag lists" do
  context "basic anag leet test list" do
    it 'simple return' do
      inp_strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
      res = group_anagrams inp_strs
      expect(res).to eq [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
    end
  end
end
