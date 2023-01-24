def my_map(arr, &prc)
    a = []
    arr.each { |ele| a << prc.call(ele) }
    a
end

def my_select(arr, &prc)
    a = []
    arr.each { |ele| a << ele if prc.call(ele) }
    a
end

def my_count(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count
end

def my_any?(arr, &prc)
    arr.each do |ele|
        return true if prc.call(ele)
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |ele|
        return false if !prc.call(ele)
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |ele|
        return false if prc.call(ele)
    end
    true
end