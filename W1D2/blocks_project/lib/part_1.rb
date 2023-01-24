def select_even_nums(arr)
    arr.select { |n| n.even? }
end

def reject_puppies(arr)
    arr.reject do |dog|
        dog["age"] <= 2
    end
end

def count_positive_subarrays(arr)
    arr.count { |subarray| subarray.sum > 0 }
end

def aba_translate(word)
    vowels = 'AEIOUaeiou'
    w = ''
    i = 0
    while i < word.length
        if vowels.include?(word[i])
            w += word[i] + 'b' + word[i].downcase
        else
            w += word[i]
        end
        i += 1
    end
    return w
end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end