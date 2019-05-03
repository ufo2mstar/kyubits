# = Parse Gherkins into my mental models
#
# Init Parser and get to action on a given location
# @
class GherkinParser
  attr_accessor :location
  attr_reader :features

  def initialize loc = '*'
    @location = loc
    @features = get_features @location
  end

  private

  # if you need to ignore any pattern of files, change this regex to match those patterns
  IGNORE_EXP = //

  # dir glob for all feature files
  # @param location dir location of all the feature files
  def get_features(loc)
    Dir.glob(loc).reject {|x| x =~ IGNORE_EXP}
  end

end
