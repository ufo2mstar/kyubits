
require 'rspec'
require_relative 'simple_inorder_itr'

require_relative '../../../learns/trees/bst/bin_tree_init'

describe Iterator do
  context 'init' do

    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}
    it 'should take a bst root' do
      bin_tree.insert_level_order ary
      itr = Iterator.new bin_tree
      expect(itr.tree).to equal bin_tree
    end

  end

  context 'method defs' do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}
    let(:empty_tree) {BinTree.new}
    let(:itr) {Iterator.new bin_tree.insert_level_order ary}
    it 'has_next?' do
      empty_itr = Iterator.new empty_tree
      expect(empty_itr.has_next?).to equal false
      expect(itr.has_next?).to equal true
    end
    it 'next' do

    end
  end
end
