using Test

ERROR_BOUND = 1e-12


function approximate_cosine(x)

    cosine = 0
    n = 0

    while abs(cos(x) - cosine) > ERROR_BOUND
        cosine += (-1)^n * (x^(2*n)) / factorial(big(2*n))
        n += 1
    end

    return cosine
end


function approximate_sine(x)

    sine = 0
    n = 0

    while abs(sin(x) - sine) > ERROR_BOUND
        sine += (-1)^n * (x^(2*n+1)) / factorial(big(2*n+1))
        n += 1
    end
    
    return sine
end


@testset "Cosine Approximation Test" begin
    @test (approximate_cosine(0) - 1) <= ERROR_BOUND
    @test (approximate_cosine(π/6) - sqrt(3)/2) <= ERROR_BOUND
    @test (approximate_cosine(π/4) - sqrt(2)/2) <= ERROR_BOUND
    @test (approximate_cosine(π/3) - 1/2) <= ERROR_BOUND
    @test (approximate_cosine(π/2) - 0) <= ERROR_BOUND
    @test (approximate_cosine(π) - (-1)) <= ERROR_BOUND
    @test (approximate_cosine(3*π/2) - 0) <= ERROR_BOUND
end


@testset "Sine Approximation Test" begin
    @test (approximate_sine(0) - 0) <= ERROR_BOUND
    @test (approximate_sine(π/6) - 1/2) <= ERROR_BOUND
    @test (approximate_sine(π/4) - sqrt(2)/2) <= ERROR_BOUND
    @test (approximate_sine(π/3) - sqrt(3)/2) <= ERROR_BOUND
    @test (approximate_sine(π/2) - 1) <= ERROR_BOUND
    @test (approximate_sine(π) - 0) <= ERROR_BOUND
    @test (approximate_sine(3*π/2) - (-1)) <= ERROR_BOUND
end
