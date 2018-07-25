require 'rspec'
require_relative 'amz_retry'

describe 'My behaviour' do

  context "terrible get_unique_chars" do

    it 'BA' do
      str1 = "ABBA"
      exp1 = "BA"
      res1 = get_unique_chars str1
      res1 = res1.sort.reverse.join
      expect(res1).to eq exp1
    end

    it 'should do something' do
      str1 = "CCAPAJEBO"
      exp1 = "POJECBA"
      res1 = get_unique_chars str1
      res1 = res1.sort.reverse.join
      expect(res1).to eq exp1
    end

  end

  context "better get_unique_chars" do

    it 'BA' do
      str1 = "ABBA"
      exp1 = "BA"
      res1 = better_get_unique_chars str1
      expect(res1).to eq exp1
    end

    it 'should do something' do
      str1 = "CCAPAJEBO"
      exp1 = "POJECBA"
      res1 = better_get_unique_chars str1
      expect(res1).to eq exp1
    end

  end
end
