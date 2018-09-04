

outer = 1

def m a_var
    inner = 9
    puts "inner var = #{inner}"
    proc {inner + a_var}
end

p = m outer

puts "AAAA: #{p}"

puts "p is a #{p.class}"

outer = 0
puts "changed outer to #{outer}"

puts "result of proc call: #{p.call}"

p = m outer

puts "result of proc call: #{p.call}"
# inner var = 9
# p is a Proc
# changed outer to 0
# result of call : 10
