using Test


function recursive_factorial(n)
    if n <= 1
        return 1
    end
    return n * recursive_factorial(n-1)
end


function iterative_factorial(n)
    fact = 1
    while (n > 0)
        fact *= n
        n -= 1
    end
    return fact
end


@testset "Recursive Factorial Test" begin
    @test recursive_factorial(0) == 1
    @test recursive_factorial(1) == 1
    @test recursive_factorial(2) == 2
    @test recursive_factorial(3) == 6
    @test recursive_factorial(4) == 24
    @test recursive_factorial(5) == 120
end


@testset "Iterative Factorial Test" begin
    @test iterative_factorial(0) == 1
    @test iterative_factorial(1) == 1
    @test iterative_factorial(2) == 2
    @test iterative_factorial(3) == 6
    @test iterative_factorial(4) == 24
    @test iterative_factorial(5) == 120
end
