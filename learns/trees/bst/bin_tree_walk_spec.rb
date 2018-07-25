require 'rspec'
require_relative 'bin_tree_walk'
require_relative 'bst_init'
require_relative 'bin_tree_print'

describe 'BinTree test' do

  context "level order insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_level_order ary
      expect(bin_tree.size).to equal ary.size

      bin_tree.show_tree
      bin_tree.bfs_walk {|node| print "#{node} -> "}
    end
  end

  context "bin tree test" do
    let(:ary) {(0..100).to_a}
    let(:bin_tree) {BinTree.new}

    it "add 100 vals" do
      bin_tree.insert_level_order ary
      expect(bin_tree.size).to equal ary.size

      bin_tree.show_tree
      bin_tree.bfs_walk {|node| print "#{node} -> "}
    end
  end
end

describe 'BST test' do

  context "level order insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_bst ary
      expect(bin_tree.size).to equal ary.size

      bin_tree.show_tree
      bin_tree.bfs_walk {|node| print "#{node} -> "}
    end
  end

  context "bin tree test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "add 100 vals" do
      bin_tree.insert_bst ary
      expect(bin_tree.size).to equal ary.size

      bin_tree.show_tree
      bin_tree.bfs_walk {|node| print "#{node} -> "}
    end
  end
end
