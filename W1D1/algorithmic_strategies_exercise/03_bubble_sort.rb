# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort


def bubble_sort(arr)
    i = 0
    while i < arr.length
        j = i + 1
        while j < arr.length
            if arr[j] < arr[i]
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            end
            j += 1
        end
        i += 1
    end
    return arr
end


p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]