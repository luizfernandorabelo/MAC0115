# The last value attributed to a variable determines its type

a = 3
println(typeof(a))    # Int64

a = a + 1
println(typeof(a))    # Int64

a = a + 1.0
println(typeof(a))    # Float64 

a = "abc"
println(typeof(a))    # String


# Types can be explicitly converted

println(parse(Float64, "32"))   # 32.0
println(parse(Int64, "32"))     # 32
println(trunc(Int64, 2.25))     # 2
println(float(2))               # 2.0
println(string(3))              # "3"
