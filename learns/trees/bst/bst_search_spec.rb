require 'rspec'

require_relative 'bin_tree_init'
require_relative 'bst_init'
require_relative 'bst_search'


describe 'BST test' do

  context "simple insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "found" do
      bin_tree.insert_bst ary
      expect(bin_tree.search 4).to eq "N(5) L => N(3) R => N(4) <-- there you go!"
    end

    it "not found" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search 20).to eq "20 Not Found in tree!!"
    end
  end
  #
  context "shuffle insert check" do
    let(:ary) {Random.srand 123; [5, 3, 6, 7, 2, 4, 1, 9, 8].shuffle}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.search ary.sample).to eq "N(9) L => N(5) <-- there you go!"
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search 1.23).to eq "1.23 Not Found in tree!!"
    end
  end

  context "insert random test" do

    let(:ary) {Random.srand 123; (0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.search ary.sample).to eq "N(8) R => N(70) L => N(28) R => N(63) L => N(50) L => N(42) <-- there you go!"
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.search rand).to eq "0.1530705151247731 Not Found in tree!!"
    end
  end
end
