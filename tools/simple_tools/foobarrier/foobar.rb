require 'thor'
require_relative 'lib/baker'
require_relative 'lib/chef'

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

  def bar file_pattern = "*.png" , dest_dir = File.join('.','decomp')
    puts "bar @ #{file_pattern}"
    files = Dir.glob file_pattern
    if files.empty?
      puts "No files matching pattern /#{file_pattern}/..."
      return
    end
    # decomp
    p files
    files.each do |file|
      begin
        CHEF.decomp_to file, File.join(dest_dir,File.basename(file,File.extname(file)))
      rescue Zip::ZipError
        zip_file = BAKER.parse_file file
        CHEF.decomp_to zip_file, File.join(dest_dir,File.basename(file,File.extname(file)))
      else
        # code that runs only if *no* exception was raised
      ensure
        'hope that ran well...'
      end

    end
  end

end

FooBar.start(ARGV)