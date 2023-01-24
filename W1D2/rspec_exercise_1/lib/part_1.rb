def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    s = ''
    n = 0
    while n < num
        s += str
        n += 1
    end
    s
end

def yell(str)
    str.upcase + '!'
end

def alternating_case(sentence)
    s = sentence.split(' ')
    a = []
    i = 0
    while i < s.length
        a << s[i].upcase if i % 2 == 0
        a << s[i].downcase if i % 2 != 0
        i += 1
    end
    a.join(' ')
end
