require 'fileutils'


Dir.glob("neruneru*").each_with_index do |filename, index|
  newname = "neruneru#{index + 1}.png"
  print "#{filename} -> #{newname}\n"
  FileUtils.mv(filename, newname)
end