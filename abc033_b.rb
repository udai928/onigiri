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
  p "atcoder"
else
  p winner
end
