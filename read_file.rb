module Tools
    def get_input()
        strs = Array.new
        File.open("/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/setting/setting.txt",'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s)
            end
        end
        return strs
    end

    def get_input_split_space()
        strs = Array.new
        File.open("/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/setting/setting.txt",'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

    def get_input_from(path)
        strs = Array.new
        File.open(path,'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line)
            end
        end
        return strs
    end

    def get_input_split_space_from(path)
        strs = Array.new
        File.open(path,'r:utf-8') do |f|
            f.each_line do |line|
                strs.concat(line.to_s.split(" "))
            end
        end
        return strs
    end

end
