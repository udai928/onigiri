module Tools
    def get_inputarray
        strs = Array.new
        File.open("/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/setting/setting.txt",'r:utf-8') do |f|
            f.each_line do |line|
                strs.push(line)
            end
        end
        return strs
    end

    def get_inputarray_split_space
        strs = Array.new
        File.open("/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/setting/setting.txt",'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

    def get_input_online
        str = ""
        File.open("/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/setting/setting.txt",'r:utf-8') do |f|
            str = f.readline
        end
        return str
    end

    def get_inputarray_from(path)
        strs = Array.new
        File.open(path,'r:utf-8') do |f|
            f.each_line do |line|
                strs.push(line)
            end
        end
        return strs
    end

    def get_inputarray_split_space_from(path)
        strs = Array.new
        File.open(path,'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

end
