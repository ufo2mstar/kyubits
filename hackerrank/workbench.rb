
class HackerRankLoad
  def initialize code, input, output = nil
    @code = File.open(code){|f| f.readlines}
    @input = File.open(input).readlines
    @output = output
  end

  def run
puts @code,@input
  end
end

HackerRankLoad.new('./ctci/tries_contact.rb', './ctci/data/tries/kod.txt').run