# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2
    return num == 2 if num % 2 == 0
    i = 3
    while i < Math.sqrt(num)
        return false if num % i == 0
        i += 2
    end
    return true
end
def largest_prime_factor(num)
    i = num
    while i > 0
        if num % i == 0 && prime?(i) then return i end
        i -= 1
    end
end

def unique_chars?(str)
    char_count = Hash.new(0)
    str.each_char do |char|
        char_count[char] += 1
    end
    return char_count.values.all? { |ele| ele == 1 }
end

def dupe_indices(arr)
    ele_count = Hash.new { |ele_count, ele| ele_count[ele] = [] }
    i = 0
    while i < arr.length
        ele_count[arr[i]] << i
        i += 1
    end
    ele_count.reject { |ele| ele_count[ele].length < 2 }
end

def ana_array(arr_1, arr_2)
    ele_count_1 = Hash.new { |ele_count_1, ele| ele_count_1[ele] = 0 }
    i = 0
    while i < arr_1.length
        ele_count_1[arr_1[i]] += 1
        i += 1
    end
    ele_count_2 = Hash.new { |ele_count_2, ele| ele_count_2[ele] = 0 }
    j = 0
    while j < arr_2.length
        ele_count_2[arr_2[j]] += 1
        j += 1
    end
    return ele_count_1 == ele_count_2
end