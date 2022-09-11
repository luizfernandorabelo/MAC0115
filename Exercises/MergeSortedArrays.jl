using Test


function merge_arrays(array1, array2)

    merged = []
    i = 1
    j = 1

    while i <= length(array1) && j <= length(array2)
        if array1[i] < array2[j]
            push!(merged, array1[i])
            i += 1
        elseif array2[j] < array1[i]
            push!(merged, array2[j])
            j += 1
        else
            push!(merged, array1[i])
            i += 1
            j += 1
        end
    end

    while i <= length(array1)
        push!(merged, array1[i])
        i += 1
    end

    while j <= length(array2)
        push!(merged, array2[j])
        j += 1
    end

    return merged
end

@testset "Merge Sorted Arrays Test" begin
    @test merge_arrays([], []) == []
    @test merge_arrays([], [1, 2, 3]) == [1, 2, 3]
    @test merge_arrays([1, 2, 3], []) == [1, 2, 3]
    @test merge_arrays([1, 2, 3], [4, 5, 6]) == [1, 2, 3, 4, 5, 6]
    @test merge_arrays([1, 2], [3]) == [1, 2, 3]
    @test merge_arrays([1, 3, 5], [2, 4, 6]) == [1, 2, 3, 4, 5, 6]
    @test merge_arrays([1, 3, 5, 7], [1, 2, 3, 4, 6]) == [1, 2, 3, 4, 5, 6, 7]
end
