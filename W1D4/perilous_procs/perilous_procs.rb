def some?(arr, &prc)
    arr.each do |ele|
        return true if prc.call(ele)
    end
    false
end

def exactly?(arr, n, &prc)
    true_count = 0
    arr.each do |ele|
        true_count += 1 if prc.call(ele)
    end
    true_count == n
end

def filter_out(arr, &prc)
    a = []
    arr.each { |ele| a << ele if !prc.call(ele) }
    a
end

def at_least?(arr, n, &prc)
    true_count = 0
    arr.each { |ele| true_count += 1 if prc.call(ele) }
    true_count >= n
end

def every?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele) }
    true
end

def at_most?(arr, n, &prc)
    true_count = 0
    arr.each { |ele| true_count += 1 if prc.call(ele) }
    true_count <= n
end

def first_index(arr, &prc)
    arr.each { |ele| return arr.index(ele) if prc.call(ele) }
    nil
end

def xnor_select(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) && prc_2.call(ele)) || (!prc_1.call(ele) && !prc_2.call(ele)) }
end

def filter_out!(arr, &prc)
    arr.delete_if { |ele| prc.call(ele) }
end

def multi_map(arr, n=1, &prc)
    a = []
    arr.each do |ele|
        i = n
        while i > 0
            ele = prc.call(ele)
            i -= 1
        end
        a << ele
    end
    a
end

def proctition(arr, &prc)
    true_a = []
    false_a = []
    arr.each { |ele| prc.call(ele) ? true_a << ele : false_a << ele }
    true_a.concat(false_a)
end


def selected_map!(arr, prc_1, prc_2)
    i = 0
    while i < arr.length
        if prc_1.call(arr[i])
            arr[i] = prc_2.call(arr[i])
        end
        i += 1
    end
end

def chain_map(value, prcs)
    prcs.inject(value) { |acc, prc| prc.call(acc) }
end

def proc_suffix(sentence, hash)
    s = []
    words = sentence.split(' ')
    words.each do |word|
        w = word
        hash.each { |k, v| w += v if k.call(word) }
        s << w
    end
    s.join(' ')
end

def proctition_platinum(arr, *prcs)
    h = {}
    i = 1
    while i <= prcs.length
        h[i] = []
        j = 0
        while j < arr.length
            if prcs[i - 1].call(arr[j])
                h[i] << arr[j]
                arr.delete_at(j)
                j -= 1
            end
            j += 1
        end
        i += 1
    end
    h
end

def procipher(sentence, hash)
    s = []
    words = sentence.split(' ')
    words.each do |word|
        w = word
        hash.each do |k, v|
            w = v.call(w) if k.call(word)
        end
        s << w
    end
    s.join(' ')
end

def picky_procipher(sentence, hash)
    s = []
    words = sentence.split(' ')
    words.each do |word|
        w = word
        hash.each do |k, v|
            if k.call(word)
                w = v.call(w) 
                break
            end
        end
        s << w
    end
    s.join(' ')
end