require_relative "read_file"
include Tools

dots = Tools.get_inputarray_x_y
num = dots.take(1)
dots.shift

#

dots.each_with_index{|dot_A,index| # 点Aを選択
  unless index == dots.size # 点Bは点Aの次の配列の要素から取得するするため、点Aが配列の末尾の場合を除く
    dot_B = dots.fetch(index + 1) # 点Bを選択

    # AとBの傾きMを算出
#
# Mと直交する傾きNを算出（M*N=-1）
#
# 傾きNのAを通る1次関数Oを算出
#
# 傾きNのBを通る1次関数Pを算出
#
# 点Cを選択
#
# 直線O上、または直線P上の場合、直角三角形
# 直線O、直線Pの領域内の場合、鋭角三角形
# 直線O、直線Pの領域外の場合、鈍角三角形
#

  end
}
#p num,dots
#p dots
