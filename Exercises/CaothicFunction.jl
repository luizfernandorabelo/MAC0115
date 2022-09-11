function chaotic_function(n, k, total_iterations = 1)

    if total_iterations > 30
        return
    end
    
    println(string("Level ", total_iterations, ": ", n))

    chaotic_function(n * (1 - n) * k, k, total_iterations + 1)
end


chaotic_function(.2, 2.1)
println()
chaotic_function(.2, 2.5)
println()
chaotic_function(.2, 2.8)
println()
chaotic_function(.2, 3.1)
println()
chaotic_function(.2, 3.7)