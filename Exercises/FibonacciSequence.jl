function fib(n)

    if n <= 2
        return 1
    end

    return fib(n-1) + fib(n-2)
end


function fib2(n, cache)

    if cache[n] != 0
        return cache[n]
    end

    if n <= 2
        result = 1
    else
        result = fib2(n-1, cache) + fib2(n-2, cache)
    end

    return (cache[n] = result)
end


@time begin
    for i in 1:40
        fib(i)
    end
end

@time begin
    for i in 1:40
        fib2(i, zeros(Int64, i))
    end
end