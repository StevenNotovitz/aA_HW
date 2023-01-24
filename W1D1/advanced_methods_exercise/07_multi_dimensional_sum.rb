# Write a method, multi_dimensional_sum(array), that accepts a multidimensional array as an arg 
# and returns the sum of all numbers in the array.


def flatten(array)
    if !array.kind_of?(Array)
        return [array]
    end
    flattened = []
    i = 0
    while i < array.length
        flattened = flattened.concat(flatten(array[i]))
        i += 1
    end
    return flattened
end

def multi_dimensional_sum(array)
    a = flatten(array)
    s = 0
    i = 0
    while i < a.length
        s += a[i]
        i += 1
    end
    return s
end


arr_1 = [
    [4, 3, 1],
    [8, 1],
    [2]
]

p multi_dimensional_sum(arr_1)    # => 19

arr_2 = [
    [ [3, 6], [7] ],
    [ [5, 2], 1 ]
]

p multi_dimensional_sum(arr_2)    # => 24
