def is_prime?(n)
    return false if n < 2
    return n == 2 if n % 2 == 0
    i = 3
    while i <= Math.sqrt(n)
        return false if n % i == 0
        i += 2
    end
    return true
end

def nth_prime(n)
    primes = []
    i = 1
    while n > 0
        if is_prime?(i)
            primes << i
            n -= 1
        end
        i += 1
    end
    primes[primes.length - 1]
end

def prime_range(min, max)
    (min..max).select { |i| is_prime?(i) }
end