#num = 4
num = gets.to_i
strs = ""
for n in 1..num
  p strs
  strs += gets.to_s.split(" ")
end

# str1 = "unagi 20"
# str2 = "usagi 13"
# str3 = "snuke 42"
# str4 = "smeke 7"
#
# strs = str1.split(" ") + str2.split(" ") + str3.split(" ") + str4.split(" ")

p strs
p "--------------------------"
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
  p "atcoder"
else
  p winner
end
