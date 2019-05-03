require 'thor'

DRY_RUN = true

class Dir
  def self.exist_with_case?(dir)
    self['../*'].include?(dir)
  end
end

# p Dir.exist_with_case?('derp')
# p Dir.exist_with_case?('Derp')


module Interface
  def method(name)
    define_method(name) {|*args|
      raise "interface method #{name} not implemented"
    }
  end
end

module Command
  extend Interface
  method :run
end

class MasterRename
  include Command

  # def initialize src, dest
  #   @src = src
  #   @dest = dest
  # end
end

class FileRename < MasterRename
  def run src, dest
    str = "File.rename('#{src}', '#{dest}')"
    DRY_RUN ? puts(str) : eval(str)
  end
end

class GitRename < MasterRename
  def run src, dest
    str = "git mv #{src} #{dest}"
    DRY_RUN ? puts(str) : `#{str}`
  end
end

class Renamer
  @marker = File::SEPARATOR
  IGNORE_EXP = /todo|legacy|try/

  def execute loc, &blk
    for_each_in_glob(loc) do |f|
      # p f
      src = accurate_file_name f
      dest = standardized_file_name f
      if src == dest
        blk.call src, dest
      else

      end
    end
  end

  # private

  NoDirError = Class.new NameError

  def get_glob loc
    res = Dir.glob(loc).reject {|x| x =~ IGNORE_EXP}
    puts res
    res
  end

  def for_each_in_glob loc
    res = Dir.glob(loc).reject {|x| x =~ IGNORE_EXP}
    puts "#{res.size} - files & dirs found"
    # puts res
    res.each {|file| yield file}
  end

  def get_dir(file)
    # File.dirname("/home/gumby/work/ruby.rb")   #=> "/home/gumby/work"
    File.dirname file
  end

  def get_filename(file)
    # File.basename("/home/gumby/work/ruby.rb")          #=> "ruby.rb"
    # File.basename("/home/gumby/work/ruby.rb", ".rb")   #=> "ruby"
    # File.basename("/home/gumby/work/ruby.rb", ".*")    #=> "ruby"
    File.basename file
  end

  # https://stackoverflow.com/questions/5530479/how-to-rename-a-file-in-ruby
  def snakecase_file_name name
    # name.strip.downcase.tr(" ", "_")
    # name.downcase.gsub(/\s+/,' ').tr(" ", "_")
    # name.strip.downcase.gsub(/\s+/,' ').tr(" ", "_")
    # name.strip.downcase.gsub(/\s+/,' ').tr(" ", "_")
    filename = File.basename(name, File.extname(name))
    snakecase(filename) + File.extname(name)
  end

  def snakecase str
    str.strip.downcase.gsub(/\s+/, ' ').tr(" ", "_")
  end

  def standardized_file_name file_loc
    file_dir = get_dir file_loc
    file_name = get_filename file_loc
    snake_name = snakecase_file_name file_name
    File.join file_dir, snake_name
  end

  def accurate_file_name(file_loc)
    file_dir = get_dir file_loc
    file_name = get_filename file_loc
    return File.join(file_dir, file_name) if Dir.exist_with_case? file_dir
    std_dir = snakecase file_dir
    return File.join(std_dir, file_name) if Dir.exist_with_case? std_dir
    raise NoDirError.new "no dir found @ '#{std_dir}' <<= >derived from '#{file_dir}'"
  end

  def run loc
    globbed_res = get_glob loc
    dir_mod_hsh = {}
    dir_counts = 0
    file_counts = 0
    globbed_res.each do |file_or_dir|
      puts dir_mod_hsh
      mod_loc = file_or_dir
      parent_dir = get_dir(file_or_dir)
      if dir_mod_hsh[parent_dir]
        mod_loc = file_or_dir.gsub(parent_dir, dir_mod_hsh[parent_dir])
      end
      new_loc = standardized_file_name mod_loc
      if mod_loc != new_loc
        if File.file? mod_loc
          puts "\tfile:\t#{file_counts += 1}\t: #{mod_loc} -> #{new_loc}"
        else
          dir_mod_hsh[file_or_dir] = new_loc
          puts "\tdir:\t#{dir_counts += 1}\t: #{mod_loc} -> #{new_loc}"
        end
        File.rename(mod_loc, new_loc)
      else
        puts "\t\tNo change for #{mod_loc} .. #{new_loc}"
      end
    end
  end

end


class MyCLI < Thor

  RENAMER = Renamer.new

  # desc "hello NAME", "say hello to NAME"
  # def hello(name, from = nil)
  #   puts "from: #{from}" if from
  #   puts "Hello #{name}"
  # end

  desc "all LOCATION", "run rename all to standardize the file and dir names recursively at LOCATION"

  def all loc = "../../jira*/**/*"
    puts "run rename all #{loc}"
  end

  desc "rd LOCATION", "rename all files and folders to standardize names recursively at LOCATION"

  def rd loc = "../../jira*/**/*"
    puts "execute #{loc}"
  end

  desc "rg LOCATION", "git mv all files and folders to standardize names recursively at LOCATION"

  def rg loc = "../**/file*/*"
    puts "execute #{loc}"
    RENAMER.execute loc
  end
end

MyCLI.start(ARGV)
