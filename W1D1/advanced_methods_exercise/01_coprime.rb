# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.


def get_factors(num)
    f = []
    i = 2
    while i <= num
        if num % i == 0
            f << i
        end
        i += 1
    end
    return f
end

def coprime?(num_1, num_2)
    f_1 = get_factors(num_1)
    f_2 = get_factors(num_2)
    i = 0
    while i < f_1.length
        if f_2.include?(f_1[i])
            return false
        end
        i += 1
    end
    return true
end


p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
