# Functions start with 'function' keyword and end with 'end' keyword
function print_greeting()
    println("Hey there!")
end

# One can pass parameters inside the parenthesis
function print_greeting_name(name)
    println(string("Hey there, ", name), "!")
end

# Functions return the values after the 'return' keyword
function evaluate_sum(a, b)
    return a + b
end

# The parameters can have default values
function evaluate_sum_default(a, b = 0)
    return a + b
end

# Functions can call themselves
function regressive_counting(n)
    if n < 1
        println("Boom!")
        return
    end
    println(n)
    sleep(1)
    regressive_counting(n-1)
end

print_greeting()
print_greeting_name("Louis")
println(evaluate_sum(1, 2))
println(evaluate_sum_default(3))
regressive_counting(10)