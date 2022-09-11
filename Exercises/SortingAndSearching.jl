using PyPlot


BALANCE_FACTOR = 10000


function generate_random_array(array_size)

    random_array = []

    for i in 1:array_size
        push!(random_array, rand(Int64) % array_size)
    end

    return random_array
end


function merge_array(array, start_idx, middle_idx, end_idx)

    merged = []
    i = start_idx
    j = middle_idx + 1

    while i <= middle_idx && j <= end_idx
        if array[i] < array[j]
            push!(merged, array[i])
            i += 1
        else
            push!(merged, array[j])
            j += 1
        end
    end

    while i <= middle_idx
        push!(merged, array[i])
        i += 1
    end

    while j <= end_idx
        push!(merged, array[j])
        j += 1
    end

    l = 1
    for k in start_idx:end_idx
        array[k] = merged[l] 
        l += 1
    end
end


function merge_sort_rec(array, start_idx, end_idx)

    if start_idx >= end_idx
        return
    end

    middle_idx = div(start_idx + end_idx, 2)

    merge_sort_rec(array, start_idx, middle_idx)
    merge_sort_rec(array, middle_idx + 1, end_idx)
    
    merge_array(array, start_idx, middle_idx, end_idx)
end


function merge_sort(array)
    array_copy = copy(array)
    merge_sort_rec(array_copy, 1, length(array_copy))
    return array_copy
end


function bubble_sort(array)

    array_copy = copy(array)
    array_size = length(array)

    for i in 1:array_size
        for j in 1:i
            if array_copy[j] > array_copy[i]
                array_copy[j], array_copy[i] = array_copy[i], array_copy[j]
            end
        end
    end

    return array_copy
end


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


function sequential_search(array, element)

    current_idx = 1
    end_idx = length(array)
    
    while current_idx <= end_idx
        if array[current_idx] == element
            return current_idx
        end
        current_idx += 1
    end

    return -1
end


function evaluate_sequential_search_times_average(array, total_searches)

    searched_element = length(array) * 2
    times_sum = 0

    for i in 1:BALANCE_FACTOR
        for j in 1:total_searches
            times_sum += @elapsed sequential_search(array, searched_element)
        end
    end

    return times_sum / (BALANCE_FACTOR * total_searches)
end


function evaluate_in_times_average(array, total_searches)

    searched_element = length(array) * 2
    times_sum = 0

    for i in 1:BALANCE_FACTOR
        for j in 1:total_searches
            times_sum += @elapsed searched_element in array
        end
    end

    return times_sum / (BALANCE_FACTOR * total_searches)
end


function evaluate_bubble_times_average(array, total_searches)

    searched_element = length(array) * 2
    times_sum = 0
    
    for i in 1:BALANCE_FACTOR
        times_sum += @elapsed sorted_array = bubble_sort(array)
        for j in 1:total_searches
            times_sum += @elapsed binary_search(sorted_array, searched_element)
        end
    end

    return times_sum / (BALANCE_FACTOR * total_searches)
end


function evaluate_merge_times_average(array, total_searches)

    searched_element = length(array) * 2
    times_sum = 0
    
    for i in 1:BALANCE_FACTOR
        times_sum += @elapsed sorted_array = merge_sort(array)
        for j in 1:total_searches
            times_sum += @elapsed binary_search(sorted_array, searched_element)
        end
    end

    return times_sum / (BALANCE_FACTOR * total_searches)
end


for number_of_searches in 1:10:110
    array_sizes = []
    sequential_times = []
    in_times = []
    bubble_times = []
    merge_times = []
    for array_size in 1:10:100
        searched_element = array_size + 1
        random_array = generate_random_array(array_size)
        push!(array_sizes, array_size)
        push!(sequential_times, evaluate_sequential_search_times_average(random_array, number_of_searches))
        push!(in_times, evaluate_in_times_average(random_array, number_of_searches))
        push!(bubble_times, evaluate_bubble_times_average(random_array, number_of_searches))
        push!(merge_times, evaluate_merge_times_average(random_array, number_of_searches))
    end
    pygui(true)
    plot(array_sizes, sequential_times, label="sequential search", color="purple")
    plot(array_sizes, in_times, label="'in' search", color="blue")
    plot(array_sizes, merge_times, label="merge sort + binary search", color="red")
    plot(array_sizes, bubble_times, label="bubble sort + binary search", color="orange")
    title(string("Times for ", string(number_of_searches), " search(es)"))
    legend()
    xlabel("array sizes")
    ylabel("time taken")
    show()
end
