require 'rspec'
require_relative 'bin_tree_init'

describe 'BinTree test' do

  context "level order insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_level_order ary
      bin_tree.post_order bin_tree.root
      expect(bin_tree.size).to equal ary.size
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "add 100 vals" do
      bin_tree.insert_level_order ary
      expect(bin_tree.size).to equal ary.size
    end
  end
end
