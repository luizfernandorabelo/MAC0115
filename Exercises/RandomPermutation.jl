function generate_random_permutation(n)

    random_permutation = []
    aux_vector = []

    for i in 1:n
        push!(aux_vector, i)
    end

    while n > 0
        r = rand(1:n)
        push!(random_permutation, aux_vector[r])
        deleteat!(aux_vector, r)
        n -= 1
    end

    return random_permutation
end


for i in 0:15
    println(generate_random_permutation(i))
end