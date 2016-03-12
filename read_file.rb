module Tools

    CURRENT_DIR = File.dirname(__FILE__)
    INPUT_FILE = CURRENT_DIR + "/setting.txt"

    def get_inputarray
        strs = Array.new
        File.open(INPUT_FILE,'r:utf-8') do |f|
            f.each_line do |line|
                strs.push(line.strip)
            end
        end
        return strs
    end

    def get_inputarray_split_space
        strs = Array.new
        File.open(INPUT_FILE,'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

    def get_inputarray_x_y
        strs = Array.new
        File.open(INPUT_FILE,'r:utf-8') do |f|
            f.each_line do |line|
                strs.push(line.to_s.split(" ").map(&:to_i))
            end
        end
        return strs
    end

    def get_input_online
        str = ""
        File.open(INPUT_FILE,'r:utf-8') do |f|
            str = f.readline
        end
        return str
    end

    def get_inputarray_from(input_file)
        strs = Array.new
        File.open(input_file,'r:utf-8') do |f|
            f.each_line do |line|
                strs.push(line)
            end
        end
        return strs
    end

    def get_inputarray_split_space_from(input_file)
        strs = Array.new
        File.open(input_file,'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

end
