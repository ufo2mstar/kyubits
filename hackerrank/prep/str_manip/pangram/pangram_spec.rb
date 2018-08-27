require 'rspec'
require_relative 'pangram'

describe "normal list" do
  context "right list basic test" do
    it 'empty return' do
      inp_ary = "the quick brown fox jumps over the lazy dog"
      res = pangram_exclusion_list inp_ary
      expect(res).to eq []
    end

    it 'one char return' do
      inp_ary = "the quick brown fox jump over the lazy dog"
      res = pangram_exclusion_list inp_ary
      expect(res).to eq ['s']
    end


    it 'all chars return' do
      inp_ary = ""
      res = pangram_exclusion_list inp_ary
      expect(res).to eq ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    end
  end

  context "geeks tests" do
    it "should give simple outputs" do
      inp_ary = "welcome to kod hai"
      res = pangram_exclusion_list inp_ary
      expect(res.join).to eq 'bfgjnpqrsuvxyz'
    end
    it "should give simple outputs" do
      inp_ary = "The quick brown fox jumps"
      res = pangram_exclusion_list inp_ary
      expect(res.join).to eq 'adglvyz'
    end

  end
end

describe "reverse list" do
  context "right list" do
    it 'empty return' do
      inp_ary = "the quick brown fox jumps over the lazy dog"
      res = pangram_exclusion_reverse_list inp_ary
      expect(res).to eq []
    end

    it 'one char return' do
      inp_ary = "the quick brown fox jump over the lazy dog"
      res = pangram_exclusion_reverse_list inp_ary
      expect(res).to eq ['s']
    end

    it 'all chars return' do
      inp_ary = ""
      res = pangram_exclusion_reverse_list inp_ary
      expect(res).to eq ["z", "y", "x", "w", "v", "u", "t", "s", "r", "q", "p", "o", "n", "m", "l", "k", "j", "i", "h", "g", "f", "e", "d", "c", "b", "a"]
    end
  end
end
