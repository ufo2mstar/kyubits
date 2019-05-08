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

  def parse_img input_file_name
    # todo: scan from html
    # res_name = ""
    # File.open(html_file_name,'r') do |line|
    #   f.readlines
    # end
    enc = File.read input_file_name
    dec = Base64.strict_decode64(enc)
    png_name = 'kod.png'
    File.open(png_name, 'w') {|f| f.write dec}
    png_name
  end

end

# ary = if ARGV.length > 0
#         ARGV
#       else
#         %w[
# kod.png
# ]
#       end

# puts EncodeHtml.new.html ary
# html_builder = EncodeHtml.new "./index.html"
# html_builder.write_page_with ["kod.png"]