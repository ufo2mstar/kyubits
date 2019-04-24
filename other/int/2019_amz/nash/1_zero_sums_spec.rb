require 'rspec'
require_relative '1_zero_sums'

describe "1_zero_sums" do
  context "n^3 algo" do
    it 'sums easy vals' do
      ary = [-5, -2, 0, 2, 3]
      exp = 2
      res = count_triplet_sums_n3 ary
      expect(res).to eq exp
      res = count_triplet_sums_n2_hsh ary
      expect(res).to eq exp
    end

    it 'sums harder vals' do
      ary = (-10..20).to_a
      exp = 75
      res = count_triplet_sums_n3 ary
      expect(res).to eq exp
      res = count_triplet_sums_n2_hsh ary
      expect(res).to eq exp
    end

  end

  context "bad n^2 algo" do
    # todo
  end

  context "better n^2 algo" do
    # todo
  end
end
