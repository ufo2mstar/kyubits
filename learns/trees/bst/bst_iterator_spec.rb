require 'rspec'

require_relative 'bin_tree_init'
require_relative 'bst_init'
require_relative 'bst_iterator'

Random.srand 1234

describe 'bin tree iterator test' do

  context "shuffle insert check" do
    let(:ary) {[5, 3, 6, 7, 2, 4, 1, 9, 8].shuffle}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary
      itr = bin_tree.get_iterator
      expect(itr.has_next?).to eq true
      # while itr.has_next?
      #   puts itr.next
      # end
      expect(itr.next).to eq 1
      expect(itr.next).to eq 2
      expect(itr.next).to eq 3
      expect(itr.next).to eq 4
      expect(itr.next).to eq 5
      expect(itr.next).to eq 6
      expect(itr.next).to eq 7
      expect(itr.next).to eq 8
      expect(itr.next).to eq 9
      expect(itr.has_next?).to eq false
      expect(bin_tree.size).to eq 9
    end

  end

  context "insert random test" do
    let(:ary) {(0..100).to_a.shuffle!}
    let(:bin_tree) {BinTree.new}

    it "yes" do
      bin_tree.insert_bst ary

      itr = bin_tree.get_iterator
      expect(itr.has_next?).to eq true
      while itr.has_next?
        puts itr.next
      end
      expect(itr.has_next?).to eq false
      expect(bin_tree.size).to eq 101
    end
  end
end
