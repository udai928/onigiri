require_relative "../my_tools/read_file"
include Tools

aoki = 6
takahashi = 3
min = 6

# aoki = gets.to_i
# takahashi = gets.to_i
# min = gets.to_i

min_common_multiple = aoki.lcm(takahashi)
x_common_multiple = 0
x = 1

if min == aoki and min == takahashi then
    x_common_multiple = min
else
    while x_common_multiple < min do
        x_common_multiple = min_common_multiple * x
        x+=1
    end
end
puts x_common_multiple