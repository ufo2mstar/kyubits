require 'fileutils'


src =
    "kod.txt"
dest =
    "kod"

FileUtils::DryRun.mv src,dest
# FileUtils.mv src,dest
