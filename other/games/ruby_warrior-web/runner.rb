
class Space
  def initialize
    puts "initing Space"
  end

  def empty?
    puts "#{__method__}"
  end
end

class Warrior
  def initialize
    puts "initing #{self.class}"
    @space = Space.new
  end

  def walk!
    puts '@warrior.walk!'
  end

  def attack!
    puts "@warrior.attack!"
  end

  def heal!
    puts "@warrior.heal!"
  end

  def feel
    @space
  end
end


warrior = Warrior.new

file =
    "lv_2.rb"

require_relative file

10.times {
  Player.new.play_turn(warrior)
}
