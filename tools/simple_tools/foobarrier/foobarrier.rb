require 'thor'
# require_relative 'lib/baker'
require 'base64'

class EncodeHtml

  # BASE_HTML = "based64.html"
  def initialize(file_name = "./based64.html")
    @file_name = file_name
    #   todo: add file unfound safety
  end

  def img64(path)
    ext = File.extname(path).strip.downcase[1..-1]
    # enc = Base64.encode64(File.open(path, "rb").read) # gives pretty output
    enc = Base64.strict_encode64(File.open(path, "rb").read)
    "data:image/#{ext};base64,#{enc}"
  end

  def write_page_with img_ary
    out = ['<!doctype html><html lang="en"><head> </head><body>',]
    img_ary.each {|path| out << "<img alt='#{path}' \ntitle='#{File.basename path}'\n src='#{img64 path}'\n>\n</br>"}
    out << '</body></html>'
    File.open(@file_name, 'w') {|f| out.each {|line| f.write line}}
  end

  def parse_file input_file_name
    ext = 'zip'
    str = File.read input_file_name
    enc_ary = str.scan(/src='data:image\/.*?;base64,(.*)?'/).to_a
    png_name
    enc_ary.each_with_index do |enc, i|
      dec = Base64.strict_decode64(enc.first)
      png_name = "#{input_file_name}.#{ext}"
      File.open(png_name, 'wb') {|f| f.write dec}
      png_name
    end
    png_name
  end

end


# require_relative 'lib/chef'
require 'zip'

class DiffZipFileGen

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
    io = Zip::File.open(@output_file, Zip::File::CREATE)

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

    Zip::File.open(file) do |zip_file|
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


class FooBar < Thor

  BAKER = EncodeHtml.new "./index.html"
  CHEF = DiffZipFileGen.new

  desc "foo LOCATION", "point to dir with files to foo"

  def foo loc = "."
    puts "foo @ #{loc}"
    file_name = File.join(loc, "kod.png")
    # comp
    CHEF.comp_to loc, file_name
    # bake
    BAKER.write_page_with [file_name]
  end

  desc "bar FILE_PATTERN [DEST_DIR]", "point to pattern to Dir.glob"

  def bar file_pattern = "*.html", dest_dir = File.join('.', 'decomp')
    puts "bar @ #{file_pattern}"
    files = Dir.glob file_pattern
    if files.empty?
      puts "No files matching pattern /#{file_pattern}/..."
      return
    end

    dest_maker = -> dest_dir, file {File.join(dest_dir, File.basename(file, File.extname(file)))}

    # decomp
    p files
    files.each do |file|
      if File.extname(file) =~ /htm/
        ext = BAKER.parse_file file
        bar "#{ext}", dest_dir
      else
        CHEF.decomp_to file, dest_maker[dest_dir, file]
      end

    end
  end

end

FooBar.start(ARGV)