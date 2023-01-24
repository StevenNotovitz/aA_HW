def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    arr.select { |ele| prc.call(ele) }.length == 1
end

def hash_select(hash, &prc)
    h = {}
    hash.each { |k, v| h[k] = v if prc.call(k, v) }
    h
end

def xor_select(arr, prc_1, prc_2)
    arr.select do |ele|
        prc_1.call(ele) && !prc_2.call(ele) || !prc_1.call(ele) && prc_2.call(ele)
    end
end

def proc_count(value, proc_arr)
    count = 0
    (0...proc_arr.length).each { |i| count += 1 if proc_arr[i].call(value) }
    count
end