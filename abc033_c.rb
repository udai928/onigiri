require_relative "read_file.rb"
include Tools

str = Tools.get_input_online
str_splited =  str.split("")

# str_splited = gets.chomp.split("")

ASTER = "*"
PLUS = "+"
count_multipl = 0
count_plus = 0

str_splited.each_with_index{|char,index|
    if (index == 1 and char == ASTER) or (index > 1 and char == ASTER and str_splited.fetch(index - 2) != ASTER)
        if str_splited.fetch(index - 1) == "0" and str_splited.fetch(index + 1) == "0"
        else
            index_check_plus = index
            index_of_firstzero = 0
            while index_check_plus < str_splited.size and str_splited.fetch(index_check_plus) != "+"
                if str_splited.fetch(index_check_plus) == "0" and index_of_firstzero == 0
                    index_of_firstzero = index_check_plus
                    break
                end
                index_check_plus += 1
            end
            if index_of_firstzero == 0
                str_splited[index - 1] = "0"
                count_multipl+=1
            end
        end
    end
}

while str_splited.include?("*") == true
    str_splited.each_with_index{|char,index|
        if char == ASTER
            calc_result = str_splited.fetch(index - 1).to_i * str_splited.fetch(index + 1).to_i
            str_splited.slice!(index - 1,3)
            str_splited.insert(index - 1,calc_result.to_s)
            break
        end
    }
end

str_splited.each_with_index{|char,index|
    if index % 2 == 0 and char != "0"
        count_plus += 1
    end
}
puts count_plus+count_multipl