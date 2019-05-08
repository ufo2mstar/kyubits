require 'thor'
require_relative 'lib/encode_html_b64'
require_relative 'lib/dir_zipper'

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

  def bar file_pattern = "*.html" , dest_dir = File.join('.','decomp')
    puts "bar @ #{file_pattern}"
    files = Dir.glob file_pattern
    if files.empty?
      puts "No files matching pattern /#{file_pattern}/..."
      return
    end
    # decomp
    p files
    files.each do |file|
      CHEF.decomp_to file, File.join(dest_dir,File.basename(file))
    end
  end

end

FooBar.start(ARGV)