def zip(*arr)
    a = Array.new(arr[0].length) { [] }
    (0...arr[0].length).each do |j|
        (0...arr.length).each do |i|
            a[j] << arr[i][j]
        end
    end
    a
end

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| prc_1.call(ele) && !prc_2.call(ele) || !prc_1.call(ele) && prc_2.call(ele) }
end

def zany_zip(*arr)
    a = Array.new(arr.map(&:length).max) { [] }
    (0...arr.map(&:length).max).each do |j|
        (0...arr.length).each do |i|
            a[j] << arr[i][j]
        end
    end
    a
end

def maximum(arr, &prc)
    max = arr[0]
    arr.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(arr, &prc)
    h = Hash.new { |h, k| h[k] = [] }
    arr.each do |ele|
        h[prc.call(ele)] << ele
    end
    h
end

def max_tie_breaker(arr, prc_2, &prc_1)
    max = arr[0]
    arr.each do |ele|
        max = ele if prc_1.call(ele) > prc_1.call(max)
        if prc_1.call(ele) == prc_1.call(max)
            max = ele if prc_2.call(ele) > prc_2.call(ele)
        end
    end
    max
end

def silly_syllables(sentence)
    vowels = 'AEIOUaeiou'
    s = []
    words = sentence.split(' ')
    words.each do |word|
        
        vowel_count = 0
        (0...word.length).each { |v| vowel_count += 1 if vowels.include?(word[v]) }

        if vowel_count >= 2

            index_of_first_vowel = 0
            (0...word.length).each do |i|
                if vowels.include?(word[i])
                    index_of_first_vowel = i
                    break
                end
            end

           index_of_last_vowel = 0
            (0...word.length).each { |j| index_of_last_vowel = j if vowels.include?(word[j]) }
        
            w = ''
            (index_of_first_vowel..index_of_last_vowel).each { |x| w += word[x] }
            s << w

        else
            s << word
        end
    end
    s.join(' ')
end