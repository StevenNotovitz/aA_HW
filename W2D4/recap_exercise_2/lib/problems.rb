# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    min = [num_1, num_2].min
    max = [num_1, num_2].max
    (1..min).each { |i| return max * i if (max * i) % min == 0 }
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_count = Hash.new(0)
    (1...str.length).each { |i| bigram_count[str[i - 1..i]] += 1 }
    bigram_count.each { |k, v| return k if v == bigram_count.values.max }
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        h = {}
        self.each { |k, v| h[v] = k }
        h
    end
end

class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0...self.length - 1).each do |i|
            (i + 1...self.length).each do |j|
                count += 1 if self[i] + self[j] == num
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |ele_1, ele_2| ele_1 <=> ele_2 }
        sorted = false
        while !sorted
            sorted = true
            (1...self.length).each do |i|
                if prc.call(self[i - 1], self[i]) == 1
                    self[i - 1], self[i] = self[i], self[i - 1]
                    sorted = false
                end
            end
        end
        self            
    end
end