require "byebug"

def partition(arr, num)
    a = [[], []]
    arr.each do |ele|
        ele < num ? a[0] << ele : a[1] << ele
    end
    a
end

def merge(hash_1, hash_2)
    h = {}
    hash_1.each_key { |k| h[k] = hash_1[k] }
    hash_2.each_key { |k| h[k] = hash_2[k] }
    h
end

def replace_vowels(word)
    word.tr('AEIOUaeiou', '*')
end
def censor(sentence, curses)
    a = []
    sentence.split(' ').each { |word| curses.include?(word.downcase) ? a << replace_vowels(word) : a << word }
    a.join(' ')
end

def power_of_two?(n)
    while n > 1
        n /= 2.0
    end
    n == 1
end