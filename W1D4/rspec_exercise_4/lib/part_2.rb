def proper_factors(num)
    a = []
    (1...num).each { |i| a << i if num % i == 0 }
    a
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    a = []
    i = 6
    while n > 0
        if perfect_number?(i)
            a << i
            n -= 1
        end
        i += 1
    end
    a
end
        