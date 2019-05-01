# https://stackoverflow.com/questions/4437291/what-is-java-interface-equivalent-in-ruby

module Interface
  def method(name)
    define_method(name) {|*args|
      raise "implemented interface method: '#{name}'"
    }
  end
end

module ICollection
  extend Interface
  method :add
  method :remove
end

# col = Collection.new # <-- fails, as it should
# And then you can do

class MyCollection
  include ICollection

  def add(thing)
    puts "Adding #{thing}"
  end
end

c1 = MyCollection.new
c1.add(1) # <-- output 'Adding 1'
c1.remove(1) # <-- fails with not implemented
