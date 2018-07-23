require 'rspec'
require_relative 'bst_init'

describe 'BST test' do

  context "insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bst) {BinTree.new}

    it "add all vals" do
      bst.insert_bst ary
      expect(bst.size).to equal ary.size
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bst) {BinTree.new}

    it "add all vals" do
      bst.insert_bst ary
      expect(bst.size).to equal ary.size
    end
  end
end
