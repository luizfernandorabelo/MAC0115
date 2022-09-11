function binary_search(array, element)

    start_idx = 1
    end_idx = length(array)

    while start_idx <= end_idx
        middle_idx = div(start_idx + end_idx, 2)
        if array[middle_idx] > element
            end_idx = middle_idx - 1
        elseif array[middle_idx] < element
            start_idx = middle_idx + 1
        else
            return middle_idx
        end
    end

    return -1
end
