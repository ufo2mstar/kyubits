class Item
  attr_accessor :content
end

class Step < Item
  attr_accessor :keyword, :line
  attr_accessor :table # optional
end

class InlineComment < Item

end

class Comment < Item

end

class Tag < Item

end

class Example < Item

end


class Collection
  attr_accessor :items
end

class Tags < Collection

end

class SimpleCollection < Collection
  attr_accessor :title, :comments
end

class Background < SimpleCollection

end

class SpecialCollection < SimpleCollection
  attr_accessor :tags
end

class Feature < SpecialCollection
  attr_accessor :background
end

class Scenario < SpecialCollection

end

class ScenarioOutline < Scenario
  attr_accessor :examples
end
