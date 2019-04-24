require 'rspec'
require_relative '1_zero_sums'

describe "1_zero_sums" do
  context "sample case" do
    it 'sums easy vals' do
      ary = [-5, -2, 0, 2, 3]
      exp = 2
      # res = count_triplet_sums_n3 ary
      res = count_triplet_sums_n2_hsh ary
      expect(res).to eq exp
    end
  end
end