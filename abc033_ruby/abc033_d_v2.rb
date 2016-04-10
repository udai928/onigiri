require_relative "read_file"
include Tools

dots = Tools.get_inputarray_x_y
num = dots.take(1)
dots.shift

=begin
三角形の３辺を、a , b , c （c が最も長い辺、つまり∠Ｃが最大角）とするときに
a^2 + b^2 > c^2 ..... ∠Ｃは鋭角→鋭角三角形
a^2 + b^2 < c^2 ..... ∠Ｃは鈍角→鈍角三角形
a^2 + b^2 = c^2 ..... ∠Ｃは直角→直角三角形
=end


# num  = gets.to_i
# dots = Array.new
#
# for n in 1..num
#     dots.push(gets.split(" ").map(&:to_i))
# end

acute_angle = 0 #鋭角
obtuse_angle = 0 #鈍角
right_angle = 0 #直角


dots.each_with_index{|dot_A,index| # 点Aを選択
    if index < dots.size - 1# 点Bは点Aの次の配列の要素から取得するするため、点Aが配列の末尾の場合を除く

        a_x = dot_A.fetch(0)
        a_y = dot_A.fetch(1)

        for index_dot_B in (index + 1)..(dots.size - 2) do

            dot_B = dots.fetch(index_dot_B) # 点Bを選択
            b_x = dot_B.fetch(0)
            b_y = dot_B.fetch(1)

            for index_dot_C in (index_dot_B + 1)..(dots.size - 1) do

                dot_C = dots.fetch(index_dot_C)
                c_x = dot_C.fetch(0)
                c_y = dot_C.fetch(1)
                #puts "a(#{a_x},#{a_y})|b(#{b_x},#{b_y})|c(#{c_x},#{c_y})"

                #a-bの距離
                a_b = (b_x - a_x)**2 + (b_y - a_y)**2
                #b-cの距離
                b_c = (c_x - b_x)**2 + (c_y - b_y)**2
                #c-aの距離
                c_a = (a_x - c_x)**2 + (a_y - c_y)**2

                sides_length = [a_b,b_c,c_a]
                #puts "-------#{sides_length}-------"
                sides_length.sort!
                #puts "+++++++#{sides_length}+++++++"
                if sides_length.fetch(2) > sides_length.fetch(1) + sides_length.fetch(0)
                    #鈍角
                    obtuse_angle+=1
                elsif sides_length.fetch(2) < sides_length.fetch(1) + sides_length.fetch(0)
                    #鋭角
                    acute_angle+=1
                else
                    #直角
                    right_angle+=1
                end
            end
        end
    end
}
puts "#{acute_angle} #{right_angle} #{obtuse_angle}"