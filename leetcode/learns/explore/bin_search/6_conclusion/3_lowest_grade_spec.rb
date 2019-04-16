require 'rspec'
require_relative '3_lowest_grade'

describe 'My behaviour' do

  context 'my tests' do
    it 'mid match' do
      inp = ["c", "f", "j"]
      x = 'f'
      exp = 'j'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
    it 'should do something' do
      inp = ["c", "f", "j"]
      x = 'g'
      exp = 'j'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
    it 'left out' do
      inp = ["c", "f", "j"]
      x = 'a'
      exp = 'c'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
    it 'right out - wrap around' do
      inp = ["c", "f", "j"]
      x = 'z'
      exp = 'c'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
  end

  context 'their tests' do
    it 'should account for repeated elements' do
      inp = ["e","e","e", "n", "n"]
      x = 'e'
      exp = 'n'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
    it 'should account for repeated elements' do
      inp = ["e","e","e", "n", "n"]
      x = 'a'
      exp = 'e'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
    it 'should account for repeated elements' do
      inp = ["e","e","e","k","q","q","q","v","v","y"]
      x = "q"
      exp = 'v'
      res = next_greatest_letter inp, x
      expect(res).to eq exp
    end
  end
end
