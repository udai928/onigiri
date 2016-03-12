# CURRENT_DIR = Dir.pwd
# INPUT_FILE = CURRENT_DIR + "/setting.txt"

CURRENT_DIR = File.dirname(__FILE__)
INPUT_FILE = CURRENT_DIR + "/setting.txt"

strs = Array.new
File.open(INPUT_FILE,'r:utf-8') do |f|
    f.each_line do |line|
        strs.push(line.strip)
    end
end
p strs
#
# str_splited = gets.chomp.split("")
# p str_splited
