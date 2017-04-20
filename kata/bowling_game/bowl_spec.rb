require 'rspec'
require_relative 'bowl'

# desc "setup game and start rolling"
describe Game do

	let(:game) {Game.new}

	def roll rolls , pins
		rolls.times do |n|
			game.roll(pins)
		end
	end

	context "simple rolls" do
		it "scores blank rolls"	do
			roll(20,0)
			expect(game.score).to eql(0)
		end
	end
end