def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    a = []
    sentence.split(' ').each { |word| a << prc.call(word) }
    a.join(' ')
end

def greater_proc_value(n, prc_1, prc_2)
    [prc_1.call(n), prc_2.call(n)].max
end

def and_selector(arr, prc_1, prc_2)
    a = []
    arr.each { |ele| a << ele if prc_1.call(ele) && prc_2.call(ele) }
    a
end

def alternating_mapper(arr, prc_1, prc_2)
    a = []
    arr.each_with_index do |ele, i|
        a << prc_1.call(ele) if i.even?
        a << prc_2.call(ele) if !i.even?
    end
    a
end