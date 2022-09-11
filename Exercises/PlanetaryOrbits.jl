# Sample Command Line Inputs:
#   - Running Tests:
#       $ julia PlanetaryOrbits.jl
#   - Plotting Graphics (for Earth, Halley's Comet and Circular Orbit, respectively):
#       $ julia PlanetaryOrbits.jl 1.9891e30 5.9736e24 1.4710e11 3.0287e4
#       $ julia PlanetaryOrbits.jl 1.9891e30 2.2e14 8.783e10 5.4529e4
#       $ julia PlanetaryOrbits.jl 1.9891e30 0 8.7830E10 38877.065

using Test
using PyPlot
  

ERROR_BOUND = 1e-3
YEAR_SECONDS = 60 * 60 * 24 * 365
G = 6.6738e-11


function evaluate_apogee_velocity(central_body_mass, perigee_distance, perigee_velocity)

    a = 1
    b = -1 * (2 * G * central_body_mass) / (perigee_velocity * perigee_distance) 
    c = -1 * (perigee_velocity ^ 2 - 2 * G * central_body_mass / perigee_distance)

    Δ = (b ^ 2) - 4 * a * c

    v1 = (- b + √Δ) / (2 * a)
    v2 = (- b - √Δ) / (2 * a)

    return minimum([v1, v2])
end


function evaluate_apogee_distance(perigee_distance, perigee_velocity, apogee_velocity)
    return perigee_distance * perigee_velocity / apogee_velocity
end


function evaluate_semi_major_axis(perigee_distance, apogee_distance)
    return (perigee_distance + apogee_distance) / 2
end


function evaluate_semi_minor_axis(perigee_distance, apogee_distance)
    return √(perigee_distance * apogee_distance)
end


function evaluate_orbital_period(s_major_axis, s_minor_axis, perigee_distance, perigee_velocity)
    return (2 * π * s_major_axis * s_minor_axis) / (perigee_distance * perigee_velocity * YEAR_SECONDS)
end


function evaluate_orbital_eccentricity(perigee_distance, apogee_distance)
    return (apogee_distance - perigee_distance) / (apogee_distance + perigee_distance)
end


function evaluate_orbital_radius(s_major_axis, orbital_eccentricity, angle)
    return (s_major_axis * (1 - (orbital_eccentricity ^ 2))) / (1 + orbital_eccentricity * cos(angle))
end


function evaluate_absolute_velocity(central_body_mass, in_orbit_body_mass, s_major_axis, radius)
    return √(G * (central_body_mass + in_orbit_body_mass) * (2 / radius - 1 / s_major_axis))
end


function execute_test_sets()
    @testset "Earth Tests" begin
        @test abs(evaluate_apogee_velocity(1.9891e30, 1.4710e11, 3.0287e4) / 29305.399 - 1) <= ERROR_BOUND
        @test abs(evaluate_apogee_distance(1.471e11, 3.0287e4, 29305.4) / 1.520272e11 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_major_axis(1.471e11, 1.52027197e11) / 1.495636e11 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_minor_axis(1.471e11, 1.52027197e11) / 1.4954330714e11 - 1) <= ERROR_BOUND
        @test abs(evaluate_orbital_eccentricity(1.471e11, 1.52027197e11) / 0.016472 - 1) <= ERROR_BOUND
        @test abs(evaluate_orbital_period(1.495636e11, 1.495433e11, 1.4710e11, 3.0287e4) / 1.00022 - 1) <= ERROR_BOUND
    end
    println()
    @testset "Halley's Comet Tests" begin
        @test abs(evaluate_apogee_velocity(1.9891e30, 8.783e10, 5.4529e4) / 906.6807 - 1) <= ERROR_BOUND
        @test abs(evaluate_apogee_distance(8.783e10, 5.4529e4, 906.68069) / 5.2822147e12 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_major_axis(8.783e10, 5.2822147e12) / 2.685022e12 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_minor_axis(8.783e10, 5.2822147e12) / 6.8112914e11 - 1) <= ERROR_BOUND
        @test abs(evaluate_orbital_eccentricity(8.783e10, 5.2822147e12) / 0.967289 - 1) <= ERROR_BOUND
        @test abs(evaluate_orbital_period(2.6850223e12, 6.81129146e11, 8.783e10, 5.4529e4) / 76.08170 - 1) <= ERROR_BOUND
    end
    println()
    @testset "Circular Orbit Tests" begin
        @test abs(evaluate_apogee_velocity(1.9891e30, 8.783e10, 38877.065) / 38877.064 - 1) <= ERROR_BOUND
        @test abs(evaluate_apogee_distance(8.783e10, 38877.065, 38877.064) / 8.7830E10 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_major_axis(8.783e10, 8.783e10) / 8.783e10 - 1) <= ERROR_BOUND
        @test abs(evaluate_semi_minor_axis(8.783e10, 8.783e10) / 8.783e10 - 1) <= ERROR_BOUND
        @test abs(evaluate_orbital_eccentricity(8.783e10, 8.783e10)) <= ERROR_BOUND
        @test abs(evaluate_orbital_period(8.783e10, 8.783e10, 8.783e10, 38877.064) / 0.45011 - 1) <= ERROR_BOUND
    end
end


function main()

    if length(ARGS) != 4
        execute_test_sets()
        print("\n- You can rerun the program passing specific arguments from the command line, i.e.:\n>>> Command Line:  ")
        print("julia PlanetaryOrbits.jl centralBodyMass inOrbitBodyMass perigeeDistance perigeeVelocity\n")
        exit()
    end

    println("Evaluating...")

    central_body_mass = parse(Float64, ARGS[1])
    in_orbit_body_mass = parse(Float64, ARGS[2])
    perigee_distance = parse(Float64, ARGS[3])
    perigee_velocity = parse(Float64, ARGS[4])

    apogee_velocity = evaluate_apogee_velocity(central_body_mass, perigee_distance, perigee_velocity)
    apogee_distance = evaluate_apogee_distance(perigee_distance, perigee_velocity, apogee_velocity)
    s_major_axis = evaluate_semi_major_axis(perigee_distance, apogee_distance)
    s_minor_axis = evaluate_semi_minor_axis(perigee_distance, apogee_distance)
    orbital_eccentricity = evaluate_orbital_eccentricity(perigee_distance, apogee_distance)
    orbital_period = evaluate_orbital_period(s_major_axis, s_minor_axis, perigee_distance, perigee_velocity)

    println(" M\t", central_body_mass)
    println(" m\t", in_orbit_body_mass)
    println("vₘₐₓ\t", perigee_velocity)
    println("vₘᵢₙ\t", apogee_velocity)
    println(" l₁\t", perigee_distance)
    println(" l₂\t", apogee_distance)
    println(" a\t", s_major_axis)
    println(" b\t", s_minor_axis)
    println(" e\t", orbital_eccentricity)
    println(" T\t", orbital_period)

    println("Plotting graphics...")

    angles = []
    orbital_radiuses = []
    orbital_velocities = []

    for θ in 0:π/150:2*π+ERROR_BOUND
        current_radius = evaluate_orbital_radius(s_major_axis, orbital_eccentricity, θ)
        current_velocity = evaluate_absolute_velocity(central_body_mass, in_orbit_body_mass, s_major_axis, current_radius)
        push!(angles, θ)
        push!(orbital_radiuses, current_radius)
        push!(orbital_velocities, current_velocity)
    end

    pygui(true)

    plot(angles, orbital_radiuses, label="Radiuses Length", color="red")
    title("Angle X Orbital Radius")
    legend()
    xlabel("Angles (radians)")
    ylabel("Radiuses (m)")
    show()

    plot(angles, orbital_velocities, label="Velocities", color="green")
    title("Angle X Orbital Velocities")
    legend()
    xlabel("Angles (radians)")
    ylabel("Orbital Velocities (m/s)")
    show()

    orbit_xs = []
    orbit_ys = []

    for i in 1:length(angles)
        push!(orbit_xs, orbital_radiuses[i] * cos(angles[i]))
        push!(orbit_ys, orbital_radiuses[i] * sin(angles[i]))
    end

    plot(orbit_xs, orbit_ys, label="Orbit", color="black")
    title("Formed Orbit")
    legend()
    xlabel("R cos(θ)")
    ylabel("R sin(θ)")
    axis("scaled")
    show()

end

main()
