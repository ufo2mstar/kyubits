require 'rspec'
require_relative 'step_back_track'

describe 'static steps' do
  context "[1,2,3] steps" do
    let(:jumps) {[1, 2, 3]}

    it 'should compute out' do
      inp = 7
      res = stepPerms inp
      expect(res).to eq 44
    end

    it 'should compute out' do
      inp = 5
      res = stepPerms inp
      expect(res).to eq 13
    end
  end

  context "[2,3] steps" do
    let(:jumps) {[2, 3]}

    it 'should compute out' do
      inp = 7
      res = stepPerms inp, jumps
      expect(res).to eq 3
    end

    it 'should compute out' do
      inp = 5
      res = stepPerms inp, jumps
      expect(res).to eq 2
    end

    it 'should compute out' do
      inp = 4
      res = stepPerms inp, jumps
      expect(res).to eq 1
    end

    it 'should compute out' do
      inp = 1
      res = stepPerms inp, jumps
      expect(res).to eq 0
    end
  end
end
