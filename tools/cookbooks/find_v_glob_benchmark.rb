# https://stackoverflow.com/questions/3498539/searching-a-folder-and-all-of-its-subfolders-for-files-of-a-certain-type
# https://blog.appsignal.com/2018/02/27/benchmarking-ruby-code.html
# https://github.com/evanphx/benchmark-ips

require 'find'
# require 'benchmark'
require 'benchmark/ips'

dir = '../../'
ext = '\.rb'

Benchmark.ips do |x|
  x.report 'Find.find' do
    Find.find(dir).select { |f| f =~ /\*#{ext}/ }
  end

  x.report 'Dir.glob' do
    Dir.glob("#{dir}/**/*#{ext}")
  end

  x.compare!
end

# ext = '\.pdf'
# Warming up --------------------------------------
# Find.find     1.000  i/100ms
# Dir.glob     2.000  i/100ms
# Calculating -------------------------------------
# Find.find      3.989  (± 0.0%) i/s -     20.000  in   5.017153s
# Dir.glob     23.032  (± 4.3%) i/s -    116.000  in   5.047851s
#
# Comparison:
#     Dir.glob:       23.0 i/s
# Find.find:        4.0 i/s - 5.77x  slower