require_relative "read_file"
include Tools

dots = Tools.get_inputarray_x_y
num = dots.take(1)
dots.shift

#

dots.each_with_index{|dot_A,index| # 点Aを選択
    if index < dots.size - 1# 点Bは点Aの次の配列の要素から取得するするため、点Aが配列の末尾の場合を除く
        for index_dot_B in (index + 1)..(dots.size - 2) do
            dot_B = dots.fetch(index_dot_B) # 点Bを選択

            a_x = dot_A.fetch(0)
            a_y = dot_A.fetch(1)
            b_x = dot_B.fetch(0)
            b_y = dot_B.fetch(1)

            puts "a(#{a_x},#{a_y})"
            puts "b(#{b_x},#{b_y})"

            # AとBの傾きMを算出
            if a_x - b_x == 0
                puts "x = #{a_x} の式"
                puts "直行する式の傾きはy = Nの式"

            elsif a_y - b_y == 0
                puts "y = #{a_y} の式"
                puts "直行する式の傾きはx = Nの式"
            else
                # Mと直交する傾きNを算出（M*N=-1）
                slope_M = (a_x - b_x)/(a_y - b_y)
                puts slope_M

                p orthogonal_N = slope_M * -1
                # 傾きNのAを通る1次関数Oを算出
                intercept_A = -1 * ((orthogonal_N * a_x) - a_y)
                puts "y = #{orthogonal_N}x + #{intercept_A}"
                # 傾きNのBを通る1次関数Pを算出
                intercept_B = -1 * ((orthogonal_N * b_x) - b_y)
                puts "y = #{orthogonal_N}x + #{intercept_B}"
            end

            # 点Cを選択
            index_dot_C = index_dot_B + 1
            dot_C = dots.fetch(index_dot_C)
            c_x = dot_C.fetch(0)
            c_y = dot_C.fetch(1)

            if c_y == ((orthogonal_N * c_x) + intercept_A)  or c_y == ((orthogonal_N * c_x) + intercept_B)
                # 直線O上、または直線P上の場合、直角三角形
                puts "直角三角形"
            elsif intercept_A > intercept_B
                if c_y > ((orthogonal_N * c_x) + intercept_A)  and c_y < ((orthogonal_N * c_x) + intercept_B)
                # 直線O、直線Pの領域外の場合、鈍角三角形
                    puts "鈍角三角形"
                elsif c_y < ((orthogonal_N * c_x) + intercept_A)  and c_y > ((orthogonal_N * c_x) + intercept_B)
                    puts "鋭角三角形"
                # 直線O、直線Pの領域内の場合、鋭角三角形
                else
                    puts "なんかおかしい0"
                end
            elsif intercept_A < intercept_B
                if c_y < ((orthogonal_N * c_x) + intercept_A)  and c_y > ((orthogonal_N * c_x) + intercept_B)
                # 直線O、直線Pの領域外の場合、鈍角三角形
                    puts "鈍角三角形"
                elsif c_y > ((orthogonal_N * c_x) + intercept_A)  and c_y < ((orthogonal_N * c_x) + intercept_B)
                # 直線O、直線Pの領域内の場合、鋭角三角形
                    puts "鋭角三角形"
                else
                    puts "なんかおかしい。1"
                end

            else
                puts "なんかおかしい。2"
            end

        end
    end
}
#p num,dots
#p dots
