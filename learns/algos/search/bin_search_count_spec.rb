require 'rspec'
require_relative 'bin_search_count'

describe :bin_search_count do
  context "return -1 for" do
    it 'should empty ary' do
      res = bin_search_count([], 5)
      expect(res).to eq 0
    end
    it "should for element not found" do
      res = bin_search_count([1, 2, 3, 4, 6, 7, 7, 8, 9], 5)
      expect(res).to eq 0
    end
  end

  context "return right index for" do
    let(:ary) {}
    it "should search edges" do
      res = bin_search_count(ary, 0)
      expect(res).to eq 1
      res = bin_search_count(ary, 150)
      expect(res).to eq 1
    end

    it "should return right index" do
      res = bin_search_count(ary, 69)
      expect(res).to eq 1
    end

    it "should return random index" do
      x = ary.sample
      res = bin_search_count(ary, x)
      expect(res).to eq 1
    end

  end

  context "get counts!" do
    it "should get proper count" do
      n = 6
      ary = (-100..-30).to_a+[5]*n+ (0..30).to_a
      res = bin_search_count(ary, x)
      expect(res).to eq n
    end

    it "should get proper count" do
      n = rand(1..20)
      ary = (-100..-30).to_a+[5]*n+ (0..30).to_a
      res = bin_search_count(ary, x)
      expect(res).to eq n
    end
  end
end
