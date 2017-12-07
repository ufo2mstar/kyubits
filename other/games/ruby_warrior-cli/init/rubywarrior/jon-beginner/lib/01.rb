class Player

  LIFE = 20
  attr_accessor :warrior, :health, :state

  def initialize
    # define states
    state_clear = Clear.new self

    # assign
    @health = LIFE
    @state = state_clear
  end

  def play_turn(warrior)
    @warrior = warrior
    @state.decide
    @state.move
  end

  def decide

  end

  def move

  end

  def walk
    @warrior.walk!
  end

  def attack
    @warrior.attack!
  end

  def heal
    @warrior.heal!
  end

end


module State
  def decide
    info
  end

  def move
    info
  end

  def initialize player
    @player = player
  end

  private
  def info
    # puts 'default '+__method__
    puts 'default '
  end

end

class Clear
  include State

  def decide

  end

  def move
    @player.walk
  end

end