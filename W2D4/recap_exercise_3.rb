def no_dupes?(arr)
    h = Hash.new(0)
    (0...arr.length).each { |i| h[arr[i]] += 1 }
    a = []
    h.each { |k, v| a << k if v == 1 }
    a
end

def no_consecutive_repeats?(arr)
    (1...arr.length).each { |i| return false if arr[i - 1] == arr[i] }
    true
end

def char_indices(str)
    h = Hash.new { |h, k| h[k] = [] }
    (0...str.length).each { |i| h[str[i]] << i }
    h
end

def longest_streak(str)
    longest_streak = str[0]
    current_streak = longest_streak
    i = 1
    while i < str.length
        if str[i] == str[i - 1]
            current_streak += str[i]
            if current_streak.length >= longest_streak.length
                longest_streak = current_streak
            end
        else
            current_streak = str[i]
        end
        i += 1
    end
    longest_streak
end

def bi_prime?(num)
    factors = []
    (2..Math.sqrt(num)).each do |i|
        if num % i == 0
            factors << i
            factors << num / i
        end
    end
    factors.length == 2
end

def vigenere_cipher(message, keys)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    s = ''
    i = 0
    while i < message.length
        s += alphabet[(alphabet.index(message[i]) + keys[i % keys.length]) % alphabet.length]
        i += 1
    end
    s
end

def vowel_rotate(str)
    vowels = 'aeiou'
    v = ''
    s = ''
    y = str.length - 1
    while y > 0
        if vowels.include?(str[y])
            v += str[y]
            break
        end
        y -= 1
    end
    j = 0
    while j < str.length
        if vowels.include?(str[j])
            v += str[j]
        end
        j += 1
    end
    i = 0
    while i < str.length
        if vowels.include?(str[i])
            s += v[0]
            v = v[1...v.length]
        else
            s += str[i]
        end
        i += 1
    end
    s
end

class String

    def select(&prc)
        s = ''
        self.each_char { |char| s << char if prc.call(char) } if prc != nil
        s
    end

    def map!(&prc)
        (0...self.length).each { |i| self[i] = prc.call(self[i], i) }
        self
    end

end

def multiply(a, b)
    return 0 if b == 0
    return a + multiply(a, b - 1) if b > 0
    return a + multiply(a, b + 1) if b < 0
end

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2
    l = lucas_sequence(length - 1)
    l << l[l.length - 1] + l[l.length - 2]
    l
end

def prime_factorization(num)
    return [num]
    (2...num).each do |i|
        if (num % i == 0)
            return [*prime_factorization(i), *prime_factorization(num / i)]
        end
    end
end