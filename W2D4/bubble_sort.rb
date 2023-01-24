def bubble_sort(arr)
    sorted = false
    while !sorted
        sorted = true
        (1...arr.length).each do |i|
            if arr[i - 1] > arr[i]
                arr[i - 1], arr[i] = arr[i], arr[i - 1]
                sorted = false
            end
        end
    end
    arr
end
p bubble_sort([6, 10, 8, -5, 9, 0, 8, 3, 2])