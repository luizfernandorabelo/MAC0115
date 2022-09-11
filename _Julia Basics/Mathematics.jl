# Julia has built-in math functions. When using them, it's important to have in mind the float precision 

# sin
println(sin(0))           # sin(0) = 0
println(sin(π/2))         # sin(π/2) = 1

# cos
println(cos(0))           # cos(0) = 1
println(cos(π/2))         # cos(π/2) = 0

# tan
println(tan(0))           # tan(0) = 0
println(tan(π/4))         # tan(π/4) = 1

# deg to rad conversion
println(deg2rad(180))     # 180 deg = π rad

# rad to deg conversion
println(rad2deg(π))       # π rad = 180 deg

# ln
println(log(1))           # ln(1) = 0
println(log(ℯ))           # ln(e) = 1

# log_base
println(log(3, 27))       # log_3 27 = 3

# log_2
println(log2(8))          # log_2 8 = 3

# log_10
println(log10(1000))      # log_10 1000 = 3

# e^x
println(exp(0))           # e ^ 0 = 1
println(exp(2))           # e ^ 2 ≈ 7.389

# absolute value
println(abs(-4))          # |-4| = 4
println(abs(4))           # |4| = 4

# square root
println(sqrt(9))          # √9 = 3
println(√9)               # √9 = 3

# cubic root
println(cbrt(27))         # cbrt(27) = 3

# factorial
println(factorial(0))     # 0! = 1
println(factorial(5))     # 5! = 120
