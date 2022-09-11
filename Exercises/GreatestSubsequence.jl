using Test


function get_partial_sum(vector, start_idx, end_idx)

    if start_idx > end_idx || length(vector) == 0
        return 0
    end

    partial_sum = 0

    for i in start_idx:end_idx
        partial_sum += vector[i]
    end

    return partial_sum
end


function get_greatest_subsequence_sum_naive(vector)

    greatest_sum = get_partial_sum(vector, 1, 1)

    for i in 1:length(vector)
        for j in i:length(vector)
            current_sum = get_partial_sum(vector, i, j)
            if current_sum > greatest_sum
                greatest_sum = current_sum
            end
        end
    end

    return greatest_sum
end


function get_greatest_subsequence_sum_kadane(vector)

    if length(vector) == 0
        return 0
    end

    greatest_sum = -Inf64
    current_sum = 0

    for i in 1:length(vector)
        current_sum += vector[i]
        if current_sum > greatest_sum
            greatest_sum = current_sum
        end
        if current_sum < 0
            current_sum = 0
        end
    end

    return greatest_sum
end


@testset "Greatest Subsequence Sum - Naive Version" begin
    @test get_greatest_subsequence_sum_naive([]) == 0
    @test get_greatest_subsequence_sum_naive([1, 2, 3]) == 6
    @test get_greatest_subsequence_sum_naive([-1, -2, -3]) == -1
    @test get_greatest_subsequence_sum_naive([10, 5, -17, 20, 5, -1, 3, -30, 10]) == 27
    @test get_greatest_subsequence_sum_naive([31, -41, 59, 26, -53, 58, 97, -93, -23, 84]) == 187
end

@testset "Greatest Subsequence Sum - Kadane Version" begin
    @test get_greatest_subsequence_sum_kadane([]) == 0
    @test get_greatest_subsequence_sum_kadane([1, 2, 3]) == 6
    @test get_greatest_subsequence_sum_kadane([-1, -2, -3]) == -1
    @test get_greatest_subsequence_sum_kadane([10, 5, -17, 20, 5, -1, 3, -30, 10]) == 27
    @test get_greatest_subsequence_sum_kadane([31, -41, 59, 26, -53, 58, 97, -93, -23, 84]) == 187
end
