require 'rspec'
require_relative 'bin_tree_print'
require_relative 'bst_init'

describe 'BinTree show test' do

  context "level order insert test" do
    # let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals LO" do
      ary = [0,0,0,0,nil,nil,0,nil,nil,nil,0]
      ary = [6,4,5,2,3,1,8,7,10,9,11]
      bin_tree.insert_level_order ary
      bin_tree.show_tree
      # expect(bin_tree.size).to equal ary.size
    end

    it "add 10 vals BST" do
      # ary = (1..9).to_a
      ary = [6,4,5,2,3,1,8,7,10,9,11]
      bin_tree.insert_bst ary
      # expect(bin_tree.insert_bst ary).to raise_error RuntimeError
      bin_tree.show_tree
      # expect(bin_tree.size).to equal ary.size
    end

    # todo: see whats going on here! exception not caught!
    # it "add 10 vals BST strict error" do
    #   ary = [0,0,0,0,nil,nil,0,nil,nil,nil,0]
    #   expect(bin_tree.insert_bst ary).to raise_error
    #   # expect(bin_tree.insert_bst ary).to raise_error RuntimeError
    #   # bin_tree.show_tree
    #   # expect(bin_tree.size).to equal ary.size
    # end
  end

end
