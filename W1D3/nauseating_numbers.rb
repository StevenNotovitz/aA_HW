def strange_sums(arr)
    count = 0
    i = 0
    while i < arr.length - 1
        j = i + 1
        while j < arr.length
            count += 1 if arr[i] + arr[j] == 0
            j += 1
        end
        i += 1
    end
    count
end

def pair_product?(arr, prod)
    i = 0
    while i < arr.length - 1
        j = i + 1
        while j < arr.length
            return true if arr[i] * arr[j] == prod
            j += 1
        end
        i += 1
    end
    false
end

def rampant_repeats(str, hash)
    s = ''
    str.each_char { |char| hash.include?(char) ? s += char * hash[char] : s += char }
    s
end

def perfect_square?(num)
    Math.sqrt(num) % 1 == 0
end

def count_factors(n)
    return 1 if n < 2
    factor_count = 2
    i = 2
    while i <= Math.sqrt(n)
        factor_count += 2 if n % i == 0 && !perfect_square?(n)
        factor_count += 1 if n % i == 0 && perfect_square?(n)
        i += 1
    end
    factor_count
end
def anti_prime?(num)
    a = Array.new(0)
    n = 2
    while n < num
        a << count_factors(n)
        n += 1
    end
    count_factors(num) > a.max
end

def matrix_addition(m1, m2)
    m = Array.new(m1.length) { Array.new }
    (0...m1.length).each do |i|
        (0...m1[i].length).each do |j|
            m[i] << m1[i][j] + m2[i][j]
        end
    end
    m
end

def factors(num)
    a = []
    (1..num).each { |i| a << i if num % i == 0 }
    a
end
def mutual_factors(*nums)
    f = []
    (0...nums.length).each { |num| f << factors(nums[num]) }
    f.inject { |acc, el| acc & el }
end

def tribonacci_number(n)
    return 1 if n < 3
    return 2 if n == 3
    tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end


def matrix_addition_reloaded(*mxs)
    return nil if mxs.any? { |mx| mx.length != mxs[0].length }
    mxs.inject { |acc, el| matrix_addition(acc, el) }
end

def squarocol?(mx)
    mx.each do |row|
        return true if row.all? { |ele| ele == row[0] }
    end
    mx.transpose.each do |column|
        return true if column.all? { |ele| ele == column[0] }
    end
    false
end

def squaragonal?(mx)
    count_1 = 1
    count_2 = 1
    (1...mx.length).each do |i|
        count_1 += 1 if mx[i][i] == mx[0][0]
        count_2 += 1 if mx[i][mx[0].length - 1 - i] == mx[0][mx[0].length - 1]
    end
    return (count_1 == mx.length || count_2 == mx.length)
end

def pascals_triangle(n)
    triangle = []
    #triangle of 1s
    (1..n).each do |i|
        row = []
        (1..i).each do |j|
            row << 1
        end
        triangle << row
    end

    (2...triangle.length).each do |i|
        row = triangle[i]
        (1...row.length - 1).each do |j|
            #mutate row
            row[j] = (triangle[i - 1][j - 1] + triangle[i - 1][j])
        end
    end

    triangle
end

def is_prime?(n)
    return false if n < 2
    return n == 2 if n % 2 == 0
    i = 3
    while i <= Math.sqrt(n)
        return false if n % i == 0
        i += 2
    end
    true
end
def mersenne_prime(n)
    x = 1
    while n > 0
        x += 1
        if is_prime?(2**x - 1)
            n -= 1
        end
    end
    (2**x - 1)
end

def triangular_num?(num)
    #triangular num is always greater than i
    (1..num).each do |i|
        return true if num == (i * (i + 1) / 2)
    end
    false
end
def triangular_word?(word)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    num = 0
    word.each_char { |char| num += alphabet.index(char) + 1 }
    triangular_num?(num)
end

def consecutive_collapse(arr)
    collapsed = false
    while collapsed == false
        collapsed = true
        (0...arr.length - 1).each do |i|
            if (arr[i] - arr[i + 1]).abs == 1
                arr.delete_at(i + i)
                arr.delete_at(i)
                collapsed = false
                break
            end
        end
    end
    arr
end

def nearest_prime_greater(x, n)
    while n > 0
        x += 1
        n -= 1 if is_prime?(x)
    end
    x
end
def nearest_prime_less(x, n)
    while n < 0
        x -= 1
        return nil if x < 2
        n += 1 if is_prime?(x)
    end
    x
end
def pretentious_primes(arr, n)
    a = []
    (0...arr.length).each do |i|
        a << nearest_prime_greater(arr[i], n) if n > 0
        a << nearest_prime_less(arr[i], n) if n < 0
    end
    a
end