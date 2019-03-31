require 'rspec'
require_relative 'bin_tree_insert'

describe 'BinTree test' do

  context "bst order insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_input_order ary
      expect(bin_tree.size).to equal ary.size
      # p bin_tree.flatten_tree
      ans = [5, 3, 6, 2, 4, nil, 7, 1, nil, nil, nil, nil, nil, nil, 9, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 8]
      expect(bin_tree.flatten_tree).to match_array ans
    end
  end

  context "bst order insert test" do
    let(:ary) {[2, 1, 3]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_input_order ary
      expect(bin_tree.size).to equal ary.size
      # p bin_tree.flatten_tree
      ans = [2, 1, 3]
      expect(bin_tree.flatten_tree).to match_array ans
    end
  end
  
  context "bst order insert test" do
    let(:ary) {[2, 3, 1]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_input_order ary
      expect(bin_tree.size).to equal ary.size
      # p bin_tree.flatten_tree
      ans = [2, 1, 3]
      expect(bin_tree.flatten_tree).to match_array ans
    end
  end

  context "bst order insert test" do
    let(:ary) {[1, 2, 3]}
    let(:bin_tree) {BinTree.new}

    it "add 10 vals" do
      bin_tree.insert_input_order ary
      expect(bin_tree.size).to equal ary.size
      # p bin_tree.flatten_tree
      ans = [1, nil, 2, nil, nil, nil, 3]
      expect(bin_tree.flatten_tree).to match_array ans
    end
  end

    # context "insert random test" do
    #   let(:ary) {(0..100).to_a.shuffle!}
    #   let(:bin_tree) {BinTree.new}
    #
    #   it "add 100 vals" do
    #     bin_tree.insert_level_order ary
    #     expect(bin_tree.size).to equal ary.size
    #   end
    # end
end
