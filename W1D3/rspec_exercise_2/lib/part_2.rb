def palindrome?(str)
    i = 0
    while i < str.length
        return false if str[i] != str[str.length - 1 - i]
        i += 1
    end
    return true
end

def substrings(str)
    a = []
    i = 0
    while i < str.length
        j = i + 1
        while j <= str.length
            a << str.slice(i...j)
            j += 1
        end
        i += 1
    end
    return a
end

def palindrome_substrings(str)
    substrings(str).select { |substring| palindrome?(substring) && substring.length > 1 }
end