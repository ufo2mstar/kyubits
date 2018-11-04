require 'rspec'
require_relative 'simple_itr'

require_relative '../../../learns/trees/bst/bin_tree_use'

describe Iterator do
  context 'init' do

    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}
    it 'defaults to preorder, should take a bst root' do
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
    let(:itr_pre) {Iterator.new(bin_tree, 'pre')}
    let(:itr_in) {Iterator.new(bin_tree, 'in')}
    let(:itr_post) {Iterator.new(bin_tree, 'post')}

    it 'has_next?' do
      empty_itr = Iterator.new empty_tree
      itr = itr_pre
      expect(empty_itr.has_next?).to equal false
      expect(itr.has_next?).to equal true
    end

    context 'real use case' do
      it 'next pre' do
        bin_tree.show_tree
        itr = itr_pre
        exp = [6, 4, 2, 1, 3, 5, 8, 7, 10, 9, 11]
        res = []
        while itr.has_next?
          res << itr.next
        end
        expect(res).to eq exp
      end
      it 'next in' do
        bin_tree.show_tree
        itr = itr_in
        exp = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        res = []
        while itr.has_next?
          res << itr.next
        end
        expect(res).to eq exp
      end
      it 'next post' do
        bin_tree.show_tree
        itr = itr_post
        exp = [1, 3, 2, 5, 4, 7, 9, 11, 10, 8, 6]
        res = []
        while itr.has_next?
          res << itr.next
        end
        expect(res).to eq exp
      end
    end
  end
end
