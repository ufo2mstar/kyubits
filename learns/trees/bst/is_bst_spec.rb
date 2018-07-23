require 'rspec'

require_relative 'bin_tree_init'
require_relative 'bst_init'
require_relative 'is_bst'

describe 'BST test' do

  context "simple insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.is_bst).to equal true
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.is_bst).to equal false
    end
  end
  #
  context "shuffle insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8].shuffle}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.is_bst).to equal true
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.is_bst).to equal false
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      expect(bin_tree.is_bst).to equal true
    end

    it "no" do
      bin_tree.insert_level_order ary
      expect(bin_tree.is_bst).to equal false
    end
  end
end
