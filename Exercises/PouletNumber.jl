using Test


function is_a_poulet_number(n::BigInt)
    return (2 ^ (n - 1) - 1) % n == 0
end


function is_product_a_poulet_number(p1::BigInt, p2::BigInt, p3::BigInt)

    if !is_a_poulet_number(p1 * p2) || !is_a_poulet_number(p1 * p3) || !is_a_poulet_number(p2 * p3)
        return false
    end

    return true
end


@testset "Poulet Number Verification" begin
    @test is_product_a_poulet_number(BigInt(37), BigInt(73), BigInt(109))
    @test is_product_a_poulet_number(BigInt(103), BigInt(307), BigInt(2143))
    @test is_product_a_poulet_number(BigInt(6529), BigInt(11119), BigInt(131071))
    @test is_product_a_poulet_number(BigInt(709), BigInt(2833), BigInt(3541))
    @test is_product_a_poulet_number(BigInt(12037), BigInt(31153), BigInt(174877))
    @test !is_product_a_poulet_number(BigInt(12), BigInt(24), BigInt(36))
    @test !is_product_a_poulet_number(BigInt(100), BigInt(73), BigInt(21))
    @test !is_product_a_poulet_number(BigInt(1), BigInt(2), BigInt(3))
end