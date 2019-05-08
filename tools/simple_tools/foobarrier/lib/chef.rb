require 'zip'

class DiffZipFileGen
  attr_accessor :input_dir

# Initialize with the directory to zip and the location of the output archive.
#   def initialize (input_dir = nil, output_file = nil)
#     @input_dir = input_dir
#     @output_file = output_file
#   end

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
    puts "\n'#{output_file}' comped!\n\n"
  end

  def decomp_to file, dest_loc
    if File.exists?(dest_loc)
      puts "Dir '#{dest_loc}' already exists.. \nwant to delete it? (undoable) y / [n]"
      ans = $stdin.gets.chomp
      if ans =~ /y/i
        puts "\ndeleting existing Decomp dir: #{dest_loc}\n\n"
        FileUtils.remove_dir(dest_loc)
      else
        puts "ok.. then not decomping '#{file}' -> '#{dest_loc}/*'"
        return
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
        if entry.nil?
          puts "nil entry in zipfile: '#{zip_file}'"
          next
        end
        dest = "#{dest_loc}/#{entry.name}"
        # Extract to file/directory/symlink
        # puts "Extracting #{entry.name} \tto\t #{dest}"
        puts "\tExtracting #{entry.name}"
        # entry.extract(dest_file)
        entry.extract(dest)

        # Read into memory
        content = entry.get_input_stream.read rescue ''
      end

      # Find specific entry
      # entry = zip_file.glob('*.csv').first
      puts "\n'#{zip_file}' decomped!\n\n"
    end
  end

# A helper method to make the recursion work.

  private

  def write_entries(entries, path, io)
    entries.each {|e|
      zip_file_path = path == "" ? e : File.join(path, e)
      disk_file_path = File.join(@input_dir, zip_file_path)
      puts "\tDeflating " + disk_file_path
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
