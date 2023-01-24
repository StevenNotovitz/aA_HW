def prime?(n)
    return false if n < 2
    return n == 2 if n % 2 == 0
    i = 3
    while i <= Math.sqrt(n)
        return false if n % i == 0
        i += 2
    end
    true
end
