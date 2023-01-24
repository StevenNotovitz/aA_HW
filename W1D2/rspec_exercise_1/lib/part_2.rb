def hipsterfy (word)
    vowels = 'AEIOUaeiou'
    i = word.length - 1
    while i > 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    return word
end

def vowel_counts(str)
    vowels = 'AEIOUaeiou'
    v_count = Hash.new(0)
    i = 0
    while i < str.length
        if vowels.include?(str[i])
            v_count[str[i].downcase] += 1
        end
        i += 1
    end
    return v_count
end

def caesar_cipher(message, n)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    s = ''
    message.each_char do |char|
        if alphabet.include?(char)
            s += alphabet[(alphabet.index(char) + n) % 26]
        else
            s += char
        end
    end
    return s
end