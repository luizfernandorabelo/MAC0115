using Test

ERROR_BOUND = 1e-10


function get_newton_square_root_recursively(n, guess)

    if (n <= 1)
        return n
    end

    # println(string("The current approximation is ", guess))

    new_guess = guess - (guess ^ 2 - n) / (2 * guess)

    if abs(new_guess - guess) < ERROR_BOUND
        return new_guess
    end

    return get_newton_square_root_recursively(n, new_guess)
end


function get_newton_square_root(n)

    if !isa(n, Number) || n < 0
        println("ERROR: Trying to get the square root of an invalid number!")
        return -1
    end

    if n <= 1
        return n
    end

    return get_newton_square_root_recursively(n, n/2)
end


@testset "Square Root Test" begin
    @test abs(get_newton_square_root(0) - 0) <= ERROR_BOUND
    @test abs(get_newton_square_root(1) - 1) <= ERROR_BOUND
    @test abs(get_newton_square_root(2) - 1.4142135623730951) <= ERROR_BOUND
    @test abs(get_newton_square_root(3) - 1.7320508075688772) <= ERROR_BOUND
    @test abs(get_newton_square_root(4) - 2) <= ERROR_BOUND
    @test abs(get_newton_square_root(5) - 2.23606797749979) <= ERROR_BOUND
    @test abs(get_newton_square_root(9) - 3) <= ERROR_BOUND
    @test abs(get_newton_square_root(25) - 5) <= ERROR_BOUND
    @test abs(get_newton_square_root(100) - 10) <= ERROR_BOUND
end
