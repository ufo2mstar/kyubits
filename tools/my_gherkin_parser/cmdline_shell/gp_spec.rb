require 'rspec'
require_relative 'gp'

describe "GherkinParserCmd" do
  context "cmd line call" do
    let(:gpc){GherkinParserCmd.new}
    it 'should contain the following preset locations' do
      res = gpc::PRESET_LOCS
      exp = ['*', '../*']
      expect(res).to eq exp
    end
    it 'does simple gp' do
      res = gpc.gp
      exp = nil
      expect(res).to eq exp
    end
    it 'does preset gp' do
      res = gpc.gpp
      exp = nil
      expect(res).to eq exp
    end
  end
end
