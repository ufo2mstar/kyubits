require 'rspec'
require_relative 'bin_search_simple'

describe :bin_search_simple do
  context "return -1 for" do
    it 'should empty ary' do
      res = bin_search_simple([], 5)
      expect(res).to eq -1
    end
    it "should for element not found" do
      res = bin_search_simple([1, 2, 3, 4, 6, 7, 7, 8, 9], 5)
      expect(res).to eq -1
    end
  end

  context "return right index for" do
    let(:ary) {(0..150).to_a}
    it "should search edges" do
      res = bin_search_simple(ary, 0)
      expect(res).to eq 0
      res = bin_search_simple(ary, 150)
      expect(res).to eq 150
    end

    it "should return right index" do
      res = bin_search_simple(ary, 69)
      expect(res).to eq 69
    end

    it "should return random index" do
      x = ary.sample
      res = bin_search_simple(ary, x)
      expect(res).to eq x
    end

  end
end
