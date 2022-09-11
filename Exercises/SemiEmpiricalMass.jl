using Test

ERROR_BOUND = 1e-3

A1 = 15.80
A2 = 18.30
A3 = 0.714
A4 = 23.20


function get_binding_energy_by_atomic_nucleus(atomic_number, mass)

    A5 = mass % 2 != 0 ? 0 : atomic_number % 2 == 0 ? 12.0 : -12.0

    t1 = A1 * mass
    t2 = A2 * cbrt(mass^2) * -1
    t3 = A3 * (atomic_number ^ 2) / (cbrt(mass)) * -1
    t4 = A4 * ((mass - 2 * atomic_number) ^ 2) / mass * -1
    t5 = A5 / sqrt(mass)
    
    return t1 + t2 + t3 + t4 + t5 
end


function get_binding_energy_by_atomic_mass_unit(be_by_atomic_nucleus, mass)
    return be_by_atomic_nucleus / mass
end


function get_binding_energy_of_most_stable_atomic_nucleus(atomic_number)

    possible_energies = []

    for mass in atomic_number : 3 * atomic_number
        be_by_atomic_nucleus = get_binding_energy_by_atomic_nucleus(atomic_number, mass)
        be_by_atomic_mass_unity = get_binding_energy_by_atomic_mass_unit(be_by_atomic_nucleus, mass)
        current_energy = (be_by_atomic_mass_unity, mass)
        push!(possible_energies, current_energy)
    end

    max_binding_energy = maximum(possible_energies)
    
    return max_binding_energy[1], max_binding_energy[2], atomic_number
end


function get_atomic_number_of_most_stable_atomic_nucleus(min_atomic_number, max_atomic_number)

    possible_energies = []
    
    for atomic_number in min_atomic_number : max_atomic_number
        current_energy = get_binding_energy_of_most_stable_atomic_nucleus(atomic_number)
        push!(possible_energies, current_energy)
    end

    max_binding_energy = maximum(possible_energies)

    return max_binding_energy[3], max_binding_energy[1], max_binding_energy[2]
end


@testset "Binding Energy by Atomic Nucleus Test" begin
    @test abs(get_binding_energy_by_atomic_nucleus(1, 1) + 26.414) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(1, 3) - 1.106) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(5, 11) - 73.151) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(10, 22) - 176.778) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(20, 44) - 379.595) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(28, 62) - 539.552) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(50, 116) - 981.443) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(75, 179) - 1425.323) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_nucleus(100, 246) - 1830.024) ≤ ERROR_BOUND
end

@testset "Binding Energy by Atomic Mass Unit Test" begin
    @test abs(get_binding_energy_by_atomic_mass_unit(1.106, 3) - 0.369) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_mass_unit(176.778, 22) - 8.0353) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_mass_unit(539.552, 62) - 8.702) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_mass_unit(981.443, 116) - 8.461) ≤ ERROR_BOUND
    @test abs(get_binding_energy_by_atomic_mass_unit(1830.024, 246) - 7.439) ≤ ERROR_BOUND
end

@testset "Binding Energy of Most Stable Atomic Nucleus Test" begin
    energy, mass, atomic_number = get_binding_energy_of_most_stable_atomic_nucleus(1)
    @test abs(energy - 0.369) ≤ ERROR_BOUND && mass == 3
    energy, mass, atomic_number = get_binding_energy_of_most_stable_atomic_nucleus(10)
    @test abs(energy - 8.035) ≤ ERROR_BOUND && mass == 22
    energy, mass, atomic_number = get_binding_energy_of_most_stable_atomic_nucleus(28)
    @test abs(energy - 8.702) ≤ ERROR_BOUND && mass == 62
    energy, mass, atomic_number = get_binding_energy_of_most_stable_atomic_nucleus(100)
    @test abs(energy - 7.439) ≤ ERROR_BOUND && mass == 246
end

@testset "Best Atomic Number of Most Stable Atomic Nucleus Test" begin
    atomic_number, energy, mass = get_atomic_number_of_most_stable_atomic_nucleus(1, 100)
    @test abs(energy - 8.702) ≤ ERROR_BOUND && atomic_number == 28 && mass == 62
end
