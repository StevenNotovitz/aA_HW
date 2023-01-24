def duos(str)
    duo_count = 0
    (1...str.length).each { |i| duo_count += 1 if str[i] == str[i - 1] }
    duo_count
end

def sentence_swap(sentence, hash)
    s = []
    words = sentence.split(' ')
    words.each do |word|
        hash.include?(word) ? s << hash[word] : s << word
    end
    s.join(' ')
end

def hash_mapped(hash, prc_1, &prc_2)
    h = {}
    hash.each { |k, v| h[prc_2.call(k)] = prc_1.call(v) }
    h
end

def counted_characters(str)
    char_count = Hash.new(0)
    str.each_char { |char| char_count[char] += 1 }
    a = []
    char_count.each_key { |char| a << char if char_count[char] > 2 }
    a
end

def triplet_true?(str)
    current_streak = 1
    (1...str.length).each do |i|
        str[i] == str[i - 1] ? current_streak += 1 : current_streak = 1
        return true if current_streak == 3
    end
    false
end

def energetic_encoding(str, hash)
    s = ''
    str.each_char do |char|
        s += hash[char] if hash.include?(char)
        s += ' ' if char == ' '
        s += '?' if !hash.include?(char) && char != ' '
    end
    s
end

def uncompress(str)
    s = ''
    i = 1
    while i < str.length
        j = str[i].to_i
        while j > 0
            s += str[i - 1]
            j -= 1
        end
        i += 2
    end
    s
end

def conjunct_select(arr, *prcs)
    a = []
    arr.each do |ele|
        a << ele if prcs.inject(prcs[0].call(ele)) { |acc, prc| acc && prc.call(ele) }
    end
    a
end

def convert_pig_latin(sentence)
    vowels = 'AEIOUaeiou'
    s = []
    words = sentence.split(' ')
    words.each do |word|
        s << word if word.length < 3
        s << word + 'yay' if vowels.include?(word[0]) && word.length >= 3
        if !vowels.include?(word[0]) && word.length >= 3
            fv = 0
            word.each_char.with_index do |char, i|
                if vowels.include?(char)
                    fv = i
                    break
                end
            end
            word[0] == word[0].upcase ? s << word.slice(fv..-1).capitalize + word.slice(0...fv).downcase + 'ay' : s << word.slice(fv..-1) + word.slice(0...fv) + 'ay'
        end
    end
    return s.join(' ')
end

def reverberate(sentence)
    vowels = 'AEIOUaeiou'
    s = []
    words = sentence.split(' ')
    words.each do |word|
        s << word if word.length < 3
        s << word + word.downcase if vowels.include?(word[word.length - 1]) && word.length >= 3
        if !vowels.include?(word[word.length - 1]) && word.length >= 3
            lv = 0
            word.each_char.with_index do |char, i|
                lv = i if vowels.include?(char)
            end
            s << word + word.slice(lv..-1)
        end
    end
    s.join(' ')
end

def disjunct_select(arr, *prcs)
    a = []
    arr.each do |ele|
        prcs.each do |prc|
            if prc.call(ele)
                a << ele
                break
            end
        end
    end
    a
end


def contains_vowels?(word)
    vowels = 'AEIOUaeiou'
    word.each_char do |char|
        return true if vowels.include?(char)
    end
    false
end

def fv(word)
    vowels = 'AEIOUaeiou'
    index_of_first_vowel= 0
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            index_of_first_vowel = i
            break
        end
    end
    index_of_first_vowel
end

def lv(word)
    vowels = 'AEIOUaeiou'
    index_of_last_vowel = 0
    word.each_char.with_index do |char, i|
        index_of_last_vowel = i if vowels.include?(char)
    end
    index_of_last_vowel
end

def alternating_vowel(sentence)
    s = []
    words = sentence.split(' ')
    words.each_with_index do |word, i|
        s << word if !contains_vowels?(word)
        if contains_vowels?(word) && i % 2 == 0
            s << word.slice(0...fv(word)) + word.slice(fv(word) + 1..-1)
        end
        if contains_vowels?(word) && i % 2 != 0
            s << word.slice(0...lv(word)) + word.slice(lv(word) + 1..-1)
        end
    end
    s.join(' ')
end

def silly_talk(sentence)
    vowels = 'AEIOUaeiou'
    s = []
    words = sentence.split(' ')
    words.each do |word|
        s << word + word[word.length - 1] if vowels.include?(word[word.length - 1])
        if !vowels.include?(word[word.length - 1])
            w = ''
            word.each_char do |char|
                vowels.include?(char) ? w += char + 'b' + char.downcase : w += char
            end
            s << w
        end
    end
    s.join(' ')
end

def compress(str)
    s = str[0]
    current_streak = 1
    i = 1
    while i < str.length
        current_streak += 1 if str[i] == str[i - 1]
        if str[i] != str[i - 1]
            s += current_streak.to_s if current_streak > 1
            current_streak = 1
            s += str[i]
        end
        s += current_streak.to_s if i == str.length - 1 && current_streak > 1
        i += 1
    end
    s
end