require 'rspec'
require_relative 'simple_inorder_itr'

require_relative '../../../learns/trees/bst/bin_tree_use'

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
    # let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:ary) {[6, 4, 5, 2, 3, 1, 8, 7, 10, 9, 11]}
    let(:bin_tree) {b = BinTree.new; b.insert_bst ary; b}
    let(:empty_tree) {BinTree.new}
    let(:itr) {Iterator.new(bin_tree)}

    it 'has_next?' do
      empty_itr = Iterator.new empty_tree
      expect(empty_itr.has_next?).to equal false
      expect(itr.has_next?).to equal true
    end

    context 'real use case' do
      it 'next pre' do
        bin_tree.show_tree
        exp = [6, 4, 2, 1, 3, 5, 8, 7, 10, 9, 11]
        res = []
        while itr.has_next?
          res << itr.next('pre')
        end
        expect(res).to eq exp
      end
      it 'next post' do
        bin_tree.show_tree
        exp = [6, 4, 2, 1, 3, 5, 8, 7, 10, 9, 11]
        res = []
        while itr.has_next?
          res << itr.next('post')
        end
        expect(res).to eq exp
      end
    end
  end
end
