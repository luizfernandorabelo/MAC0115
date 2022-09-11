# Char is a 32-bits primitive that represents single character
c = 'x'

# One can easily convert Chars to Ints and Ints to Chars
println(Int(c))     # 120
println(Char(120))  # x

# Strings are delimited by single quotes
s = "My string"
println(s)          # My string

# Strings that contain quotes characters are delimited by triple double quotes
s = """My string with "quote" characters"""
println(s)          # My string with "quote" characters

# Chars extraction (Julia is a 1-based index language)
s = "Hello, World."
println(s[begin])   # H
println(s[1])       # H
println(s[6])       # ,
println(s[end])     # .

# Substrings extraction
s = "Hello, World."
println(s[1:5])     # Hello
println(s[8:12])    # World

# Strings concatenation
firstname = "Alan"
middlename = "Mathison"
lastname = "Turing"
println(string(firstname, " ", middlename , " ", lastname)) # Alan Mathison Turing
println(firstname ^ 10)                                     # AlanAlanAlanAlanAlanAlanAlanAlanAlanAlan
