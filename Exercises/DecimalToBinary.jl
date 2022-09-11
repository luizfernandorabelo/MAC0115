using Test


function decimal_to_binary(decimal)
    
    binary = 0
    power = 1
    remainder = 0

    while decimal > 0
        remainder = decimal % 2
        decimal = div(decimal, 2)
        binary += remainder * power
        power *= 10
    end

    return binary
end


@testset "Decimal to Binary Tests" begin
    @test decimal_to_binary(0) == 0
    @test decimal_to_binary(1) == 1
    @test decimal_to_binary(2) == 10
    @test decimal_to_binary(3) == 11
    @test decimal_to_binary(13) == 1101
    @test decimal_to_binary(63) == 111111
    @test decimal_to_binary(128) == 10000000
end