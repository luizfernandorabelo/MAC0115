using Test


function binary_to_decimal(binary)

    power = 1
    decimal = 0
    digit = 0

    while binary > 0
        digit = binary % 10
        binary = div(binary, 10)
        decimal += digit * power
        power *= 2
    end

    return decimal
end


@testset "Binary to Decimal Tests" begin
    @test binary_to_decimal(0) == 0
    @test binary_to_decimal(1) == 1
    @test binary_to_decimal(10) == 2
    @test binary_to_decimal(11) == 3
    @test binary_to_decimal(1101) == 13
    @test binary_to_decimal(111111) == 63
    @test binary_to_decimal(10000000) == 128
end