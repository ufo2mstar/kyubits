require 'rspec'
require './bst_init'

describe 'BST test' do

  context "insert test" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8]}
    let(:bst) {BinTree.new}

    it "add all vals" do
      ary.each {|val|
        bst.insert_bst val
        # puts "inserted #{val}"
      }
      puts bst.to_s
      expect(bst.size).to equal ary.size
    end
  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bst) {BinTree.new}

    it "add all vals" do
      ary.each {|val|
        bst.insert_bst val
        # puts "inserted #{val}"
      }
      puts bst.to_s
      expect(bst.size).to equal ary.size
    end
  end
end
