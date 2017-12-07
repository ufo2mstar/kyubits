def pr str
  puts "  #{str}"
end

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
    # @warrior = player.warrior
    # pr "#{@warrior.class}"
  end

  private
  def info
    pr "default #{__method__}"
    # puts 'default '
  end

end

module DecidedState
  include State

  def decide
    pr "..decided to #{self.class.name}"
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
    pr "feeling: '#{@player.warrior.feel}'"
    # pr "feeling: '#{@warrior.feel}'"
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
    @player.warrior.attack!
  end

end

class Advance
  include DecidedState

  def decide
    pr "warrior health: '#{ @player.health }' vs critical health: '#{@player.critical_health}'"
    if @player.health < @player.critical_health
      @player.state = @player.heal
    else
      # @player.fight
      super
    end
  end

  def move
    @player.warrior.walk!
  end

end

class Heal
  include DecidedState

  def move
    @player.warrior.rest!
  end

end

# ----------------------------------------


class Player

  LIFE = 20
  attr_accessor :warrior, :health, :state
  attr_accessor :critical_health
  attr_reader :space_front, :space_back

  attr_reader :start,
              :fight, :advance,
              :heal

  def initialize
    # define states
    # lv 01
    @start = Start.new self
    # lv 02
    @fight = Fight.new self
    @advance = Advance.new self
    # lv 03
    @heal = Heal.new self

    # assign
    # @health = LIFE
    @critical_health = 10

    pr 'Armored up!'
  end

  def play_turn(warrior)
    @warrior = warrior
    @space_front = warrior.feel
    @health = warrior.health

    self.state = @start

    @state.decide
    @state.move
  end

  # def walk
  #   @warrior.walk!
  # end
  #
  # def attack
  #   @warrior.attack!
  # end
  #
  # def heal
  #   @warrior.heal!
  # end

  def state= new_state
    pr "New State: #{new_state.class.name}"
    @state = new_state
  end
end

