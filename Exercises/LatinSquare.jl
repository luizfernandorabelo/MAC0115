using Test


function is_line_valid(matrix, line_idx, n)
    for i in 1:n
        i_occurrences = 0
        for j in 1:n
            if matrix[line_idx][j] == i
                i_occurrences += 1
            end
        end
        if i_occurrences == 0 || i_occurrences > 1
            return false
        end
    end
    return true
end


function is_column_valid(matrix, column_idx, n)
    for i in 1:n
        i_occurrences = 0
        for j in 1:n
            if matrix[j][column_idx] == i
                i_occurrences += 1
            end
        end
        if i_occurrences == 0 || i_occurrences > 1
            return false
        end
    end
    return true
end


function is_latin_square(matrix, n)
    for i in 1:n
        if !is_line_valid(matrix, i, n) || !is_column_valid(matrix, i, n)
            return false
        end
    end
    return true
end


@testset "Latin Square Tests" begin
    @test is_latin_square([1], 1)
    @test is_latin_square([[1, 2], [2, 1]], 2)
    @test is_latin_square([[3, 1, 2], [1, 2, 3], [2, 3, 1]], 3)
    @test !is_latin_square([[3, 4], [5, 6]], 2)
    @test !is_latin_square([[3, 1, 2], [3, 2, 3], [1, 2, 3]], 3)
    @test !is_latin_square([[1, 1, 2], [2, 2, 3], [1, 2, 3]], 3)
end
