require_relative "read_file"
include Tools

dots = Tools.get_inputarray_x_y
num = dots.take(1)
dots.shift

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

            # AとBの傾きMを算出
            if a_x != b_x and a_y != b_y

                slope_M = (a_x - b_x).to_f/(a_y - b_y).to_f #A,B点を通る傾きM
                orthogonal_N = slope_M * -1 # Mと直交する傾きNを算出（M*N=-1）
                # 傾きNのAを通る1次関数Oを算出y=ax+b->b=-ax+y->b=-1*(ax-y)
                intercept_A = -1 * ((orthogonal_N * a_x) - a_y)
                puts "y = #{orthogonal_N}x + #{intercept_A}"
                # 傾きNのBを通る1次関数Pを算出
                intercept_B = -1 * ((orthogonal_N * b_x) - b_y)
                puts "y = #{orthogonal_N}x + #{intercept_B}"
            end

            p "#{intercept_A},,,#{intercept_B}"
            # 点Cを選択
            for index_dot_C in (index_dot_B + 1)..(dots.size - 1) do
                dot_C = dots.fetch(index_dot_C)

                c_x = dot_C.fetch(0)
                c_y = dot_C.fetch(1)
                puts "a(#{a_x},#{a_y})|b(#{b_x},#{b_y})|c(#{c_x},#{c_y})"

                if intercept_A != nil or intercept_B != nil
                    if c_y == ((orthogonal_N * c_x) + intercept_A)  or c_y == ((orthogonal_N * c_x) + intercept_B)
                        # 直線O上、または直線P上の場合、直角三角形
                        puts "傾きあり直角三角形"
                        right_angle+=1

                    elsif intercept_A > intercept_B
                        if c_y > ((orthogonal_N * c_x) + intercept_A) or c_y < ((orthogonal_N * c_x) + intercept_B)
                        # 直線O、直線Pの領域外の場合、鈍角三角形
                            puts "傾きあり鈍角三角形"
                            obtuse_angle+=1

                        elsif c_y < ((orthogonal_N * c_x) + intercept_A)  and c_y > ((orthogonal_N * c_x) + intercept_B)
                            puts "傾きあり鋭角三角形"
                            acute_angle+=1

                        # 直線O、直線Pの領域内の場合、鋭角三角形
                        else
                            puts "傾きありなんかおかしい0"
                        end
                    elsif intercept_A < intercept_B
                        if c_y < ((orthogonal_N * c_x) + intercept_A) or c_y > ((orthogonal_N * c_x) + intercept_B)
                        # 直線O、直線Pの領域外の場合、鈍角三角形
                            puts "傾きあり鈍角三角形"
                            acute_angle+=1

                        elsif c_y > ((orthogonal_N * c_x) + intercept_A)  and c_y < ((orthogonal_N * c_x) + intercept_B)
                        # 直線O、直線Pの領域内の場合、鋭角三角形
                            puts "傾きあり鋭角三角形"
                            obtuse_angle+=1

                        else
                            puts "傾きありなんかおかしい。1"
                        end

                    else
                        puts "なんかおかしい。2"
                    end
                else
                    if a_y != b_y and a_x == b_x #x=Nのパターン

                        if c_y == a_y or c_y == b_y
                            #直角
                            puts "直角三角形"
                            right_angle+=1

                        elsif a_y < b_y and (c_y < a_y or b_y < c_y)
                            #鈍角
                            puts "鈍角三角形"
                            obtuse_angle+=1

                        elsif a_y < b_y and a_y < c_y and c_y < b_y
                            #鋭角
                            puts "鋭角三角形"
                            acute_angle+=1

                        elsif b_y < a_y and c_y < b_y and a_y < c_y
                            #鈍角
                            puts "鈍角三角形"
                            obtuse_angle+=1

                        elsif b_y < a_y and (a_y < c_y or c_y < b_y)
                            #鋭角
                            puts "鋭角三角形"
                            acute_angle+=1

                        else
                            #なんかおかしい
                            puts "なんかおかしいx=Nのパターン"
                        end
                    elsif a_y == b_y and a_x != b_x #y=Nのパターン
                        if c_x == a_x or c_x == b_x
                            #直角
                            puts "直角三角形"
                            right_angle+=1

                        elsif b_x < a_x and (c_x < b_x or a_x < c_x)
                            #鈍角
                            puts "鋭角三角形"
                            acute_angle+=1

                        elsif a_x > b_x and c_x < b_x and a_x < c_x
                            #鋭角
                            puts "鈍角三角形"
                            obtuse_angle+=1

                        elsif a_x < b_x and (c_x < a_x or b_x < c_x)
                            #鈍角
                            puts "鈍角三角形"
                            obtuse_angle+=1

                        elsif a_x < b_x and a_x < c_x and c_x < b_x
                            #鋭角
                            puts "鋭角三角形"
                            acute_angle+=1

                        else
                            #なんかおかしい
                            puts "なんかおかしいy=Nパターン"
                        end
                    else
                        #なんかおかしい
                        puts "なんかおかしい"
                    end
                end
            end
        end
    end
}
puts "#{acute_angle} #{right_angle} #{obtuse_angle}"
#p num,dots
#p dots
