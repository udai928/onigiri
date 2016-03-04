num = 4

str1 = "unagi 20"
str2 = "usagi 13"
str3 = "snuke 42"
str4 = "smeke 7"

ary = str1.split(" ") + str2.split(" ") + str3.split(" ") + str4.split(" ")

hash = Hash[*ary]
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
