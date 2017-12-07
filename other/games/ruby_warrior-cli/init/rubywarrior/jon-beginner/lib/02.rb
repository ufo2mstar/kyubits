module State
  def decide
    # puts 'hello'
    @player.state.decide
  end

  def move
    info
  end

  def initialize player
    @player = player
  end

  private
  def info
    puts 'default '+__method__
    # puts 'default '
  end

end

module DecidedState
  include State

  def decide
    puts "..decided to #{self.class.name}"
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
    puts "  feeling: '#{@player.warrior.feel}'"
    @player.state =
        if @player.space_front.empty?
          @player.advance
        else
          @player.fight
        end
    super
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


# ----------------------------------------


class Player

  LIFE = 20
  attr_accessor :decided
  attr_accessor :warrior, :health, :state
  attr_reader :space_front, :space_back

  attr_reader :start, :fight, :advance

  def initialize
    # define states
    @start = Start.new self
    @fight = Fight.new self
    @advance = Advance.new self
    # state_injured = Injured.new self
    # state_under_attack = UnderAttack.new self
    # state_imminent_threat = ImminentThreat.new self
    # state_distant_threat = DistantThreat.new self

    # assign
    @health = LIFE

    puts 'Armored up!'
  end

  def play_turn(warrior)
    @warrior = warrior
    @space_front = @warrior.feel
    @state = @start

    @state.decide
    @state.move
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

  def state= new_state
    puts "  New State: #{new_state.class.name}"
    @state = new_state
  end
end

