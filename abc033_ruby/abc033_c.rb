require_relative "read_file.rb"
include Tools

str = Tools.get_input_online
str_splited =  str.split("+")

# str_splited = gets.chomp.split("+")

count = 0
str_splited.each_with_index{|item,index|
    if item.index("0") == nil
        count+=1
    end
}
p count