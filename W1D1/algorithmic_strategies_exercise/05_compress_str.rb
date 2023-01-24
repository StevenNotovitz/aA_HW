# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".


def compress_str(str)
    compressed = ''
    counter = 0
    i = 0
    while i < str.length
        counter += 1
        if str[i + 1] != str[i]
            if counter != 1
                compressed += counter.to_s + str[i]
            else
                compressed += str[i]
            end
            counter = 0
        end
        i += 1
    end
    return compressed
end


p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
