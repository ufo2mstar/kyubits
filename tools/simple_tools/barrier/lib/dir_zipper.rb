require 'zip'

# This is a simple example which uses rubyzip to
# recursively generate a zip file from the contents of
# a specified directory. The directory itself is not
# included in the archive, rather just its contents.
#
# Usage:
#   directoryToZip = "/tmp/input"
#   output_file = "/tmp/out.zip"
#   zf = ZipFileGenerator.new(directoryToZip, output_file)
#   zf.write()
class ZipFileGenerator
#   def initialize(input_dir, output_file)
#     @input_dir   = input_dir
#     @output_file = output_file
#   end
end

class DiffZipFileGen < ZipFileGenerator
  attr_accessor :input_dir

# Initialize with the directory to zip and the location of the output archive.
  def initialize (input_dir = nil, output_file = nil)
    @input_dir = input_dir
    @output_file = output_file
  end

# Zip the input directory.
  def comp_to(input_dir, output_file)
    @input_dir = input_dir
    # @input_dir  = @input_dir
    @output_file = output_file

    if File.exists? @output_file
      FileUtils.rm @output_file
      puts "\ndeleting existing Comp file: #{@output_file}"
    end
    # File.open(output_file, 'w')
    entries = Dir.entries(@input_dir); entries.delete("."); entries.delete("..")
    io = Zip::ZipFile.open(@output_file, Zip::ZipFile::CREATE)

    write_entries(entries, "", io)
    io.close
    puts "\n#{output_file} chaching!\n\n"
  end

  def decomp_to file, dest_loc
    if File.exists?(dest_loc)
      puts "Dir '#{dest_loc}' already exists.. \nwant to delete it? (undoable) y / [n]"
      ans = gets.chomp
      if ans =~ /y/i
        puts "\ndeleting existing Decomp dir: #{dest_loc}"
        FileUtils.remove_dir(dest_loc)
      else
        puts "ok.. then not decomping #{file} -> #{dest_loc}/"
      end
    end
    # puts "creating new Decomp dir: #{dest_loc}"
    FileUtils.mkdir_p(dest_loc)

    Zip::ZipFile.open(file) do |zip_file|
      # if File.exists?(zip_file.name)
      #   puts "already exists! #{zip_file}"
      #   next
      # end
      # Handle entries one by one
      zip_file.each do |entry|
        dest = "#{dest_loc}/#{entry.name}"
        # Extract to file/directory/symlink
        # puts "Extracting #{entry.name} \tto\t #{dest}"
        puts "Extracting #{entry.name}"
        # entry.extract(dest_file)
        entry.extract(dest)

        # Read into memory
        content = entry.get_input_stream.read rescue ''
      end

      # Find specific entry
      # entry = zip_file.glob('*.csv').first
      puts "\n#{zip_file} chaching!"
    end
  end

# A helper method to make the recursion work.

  private

  def write_entries(entries, path, io)

    entries.each {|e|
      zip_file_path = path == "" ? e : File.join(path, e)
      disk_file_path = File.join(@input_dir, zip_file_path)
      puts "Deflating " + disk_file_path
      if File.directory?(disk_file_path)
        io.mkdir(zip_file_path)
        subdir = Dir.entries(disk_file_path); subdir.delete("."); subdir.delete("..")
        write_entries(subdir, zip_file_path, io)
      else
        io.get_output_stream(zip_file_path) {|f| f.puts(File.open(disk_file_path, "rb").read())}
      end
      # puts "done with #{diskFilePath}"
    }
  end


end


# exec ----------------------------------------------------------


# # init
# zf       = DiffZipFileGen.new
#
# # comp
# curr_dir = "#{File.expand_path(File.dirname(__FILE__))}"
# out_file = "kod.png"
# in_dir  = 'com'
#
# zf.comp "#{curr_dir}/#{in_dir}", out_file
#
#
# # decomp
# dest_loc = "#{curr_dir}/decom"
#
# zf.decomp out_file, dest_loc