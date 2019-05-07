require 'rspec'
require_relative 'gherkin_parser'

describe GherkinParser do
  describe "init" do
    let(:test_loc) {'../test/files'}

    context "with ketchup" do
      let(:gp) {GherkinParser.new(test_loc)}
      it 'should pick up all the features' do
        ans = gp.features.size
        expect(ans).to eq 39
      end
    end
  end
end