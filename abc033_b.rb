#
# require "/Users/kuzuyayuudai/Documents/my-dev/競技プログラミング/onigiri/read_file.rb"
# include Tools
#
# strs = Tools.get_input_split_space()
# num = strs.take(1)
# strs.shift

num  = gets.to_i
strs = Array.new

for n in 1..num
  strs.concat(gets.split(" "))
end

hash = Hash[*strs]
hash.each_key{|key|
  hash.store(key,hash.fetch(key).to_i)
}

sum = 0

hash.each_value{|val|
  sum += val
}
majority = sum / 2

winner = hash.inject([]){|arr,(key,val)|
    arr << key if val > majority
    arr
}

if winner.size() == 0
  puts "atcoder"
else
  puts winner
end
