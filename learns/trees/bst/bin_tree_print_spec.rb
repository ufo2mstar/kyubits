require 'rspec'
require_relative 'bin_tree_print'
require_relative 'bst_init'

describe 'BinTree show test' do

  context "level order insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals LO" do
      bin_tree.insert_level_order ary
      bin_tree.show_tree
      # expect(bin_tree.size).to equal ary.size
    end

    it "add 10 vals BST" do
      bin_tree.insert_bst ary
      bin_tree.show_tree
      # expect(bin_tree.size).to equal ary.size
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "add 100 vals" do
      bin_tree.insert_level_order ary
      bin_tree.show_tree
      expect(bin_tree.size).to equal ary.size
    end

    it "add 100 vals BST" do
      bin_tree.insert_bst ary
      bin_tree.show_tree
      # expect(bin_tree.size).to equal ary.size
    end
  end
end
