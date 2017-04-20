require 'rspec'
require_relative 'bowl'

# desc "setup game and start rolling"
describe Game do

  let(:game) {Game.new}

  def roll rolls, pins
    rolls.times do |n|
      game.roll(pins)
    end
  end

  def check_score expected_score
    expect(game.score).to eql(expected_score)
  end

  def roll_spare
    game.roll(5)
    game.roll(5)
  end

  def roll_strike
    game.roll(10)
  end

  context "simple rolls" do
    it "scores blank rolls" do
      roll(20, 0)
      expect(game.score).to eql(0)
    end

    it "scores blank rolls" do
      roll(20, 1)
      expect(game.score).to eql(20)
    end
  end

  context "special cases" do
    it "spare" do
      roll_spare
      game.roll(3)
      roll(17, 0)
      check_score 16
    end
    it "strike" do
      roll_strike
    end
  end

  context "perfect game" do
    it "has 12 rounds and scores 300" do
      roll(12,10)
      check_score 300
    end
  end
end
