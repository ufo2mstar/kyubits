require 'rspec'

require_relative 'bin_tree_init'
require_relative 'bst_init'
require_relative 'bst_search'

Random.srand 123

# def complete_tree_util ary
#
# end
#
# def bst_util ary
#
# end

describe 'BST test' do

  context "simple insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "found" do
      bin_tree.insert_bst ary
      expect(bin_tree.search ary.sample).to eq "N(5) R => N(6) <-- there you go!"
    end

    it "not found" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search 20).to eq "20 Not Found in tree!!"
    end
  end
  #
  context "shuffle insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8].shuffle}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.search ary.sample).to eq "N(2) R => N(5) <-- there you go!"
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search 1.23).to eq "1.23 Not Found in tree!!"
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.search ary.sample).to eq "N(4) R => N(90) L => N(56) R => N(85) R => N(87) <-- there you go!"
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search rand).to eq "0.4774604837377845 Not Found in tree!!"
    end
  end
end
