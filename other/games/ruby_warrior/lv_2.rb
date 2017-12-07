class Player

  LIFE = 20
  attr_accessor :decided
  attr_accessor :warrior, :health, :state

  def initialize
    # define states
    state_clear = Clear.new self
    # state_injured = Injured.new self
    # state_under_attack = UnderAttack.new self
    # state_imminent_threat = ImminentThreat.new self
    # state_distant_threat = DistantThreat.new self

    # assign
    @health = LIFE
    @state = state_clear
  end

  def play_turn(warrior)
    @warrior = warrior
    @space_front = @warrior.feel

    @decided = false

    until @decided
      @state.decide
    end
    @state.move
  end

  def decided!
    @decided = true
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

module DecidedState
  extend State

  def decide
    @player.decided!
  end
end

# Clear
# Injured
# UnderAttack
# ImminentThreat
# DistantThreat
#
# Start
# SafetyCheck
# HealthCheck
# Retreat
# Heal
# Advance

class Start
  include State

  def decide
    @player.state =
        if @space_front.empty?
          @player.advance
        else
          @player.fight
        end
  end
end

class Fight
  include DecidedState

  def move
    @player.attack
  end

end

class Advance
  include DecidedState

  def move
    @player.walk
  end

end