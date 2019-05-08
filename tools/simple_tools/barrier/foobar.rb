require 'thor'

class FooBar < Thor

  desc "foo LOCATION", "point to dir with files to foo"

  def foo loc = "."
    puts "foo @ #{loc}"
  end

  desc "bar FILE", "point to html"

  def bar file = "*.html"
    puts "bar @ #{file}"
  end

end

FooBar.start(ARGV)