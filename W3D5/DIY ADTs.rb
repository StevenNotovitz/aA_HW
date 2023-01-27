class Stack

    def initialize
        @stack = Array.new
    end

    def push(ele)
        @stack.push(ele)
        ele
    end

    def pop
        @stack.pop
    end

    def peek
        @stack.last
    end

    def size
        @stack.size
    end

end

class Queue

    def initialize
        @queue = Array.new
    end

    def enqueue(ele)
        @queue.unshift(ele)
        ele
    end

    def dequeue
        @queue.pop
    end

    def peek
        @stack.last
    end

    def size
        @queue.size
    end

end

class Map

    def initialize
        @map = Array.new
    end

    def set(key, value)
        @map.each do |pair|
            pair[1] = value if pair[0] == key
            return value
        end
        @map.push([key, value])
        value
    end

    def get
        @map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        map.each_with_index do |pair, i|
            if pair[0] == key
                value = pair[1]
                @map.delete_at(i)
            end
        end
        value
    end

    def show
        deep_dup(@map)
    end

    def deep_dup(arr)   # from W3D3 recursion exercises
        a = []
        arr.each do |ele|
            !ele.is_a?(Array) ? a << ele : a << deep_dup(ele)
        end
        a
    end

end