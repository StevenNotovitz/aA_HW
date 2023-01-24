# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    
    def min
        min = self[0]
        (0...self.length).each do |i|
            min = self[i] if self[i] < min
        end
        min
    end

    def max
        max = self[0]
        (0...self.length).each do |i|
            max = self[i] if self[i] > max
        end
        max
    end

    def length
        count = 0
        self.each { |ele| count += 1 }
        count
    end

    def span
        return nil if !self.all? { |ele| ele == ele.to_i } || self.empty?
        self.max - self.min
    end

    def average
        return nil if !self.all? { |ele| ele == ele.to_i } || self.empty?
        sum = 0.0
        (0...self.length).each { |i| sum += self[i] }
        sum / self.length
    end

    def sort
        return self if self.length <= 1
        (0...self.length - 1).each do |i|
            if self[i] > self[i + 1]
                self[i], self[i + 1] = self[i + 1], self[i]
            end
        end
        self
    end

    def median
        return nil if !self.all? { |ele| ele == ele.to_i } || self.empty?
        if self.length % 2 == 0
            return (self.sort[self.length / 2 - 1] + self.sort[self.length / 2]) / 2.0
        else
            return self.sort[(self.length / 2).floor]
        end
    end

    def counts
        h = Hash.new { |h, k| h[k] = 0 }
        (0...self.length).each do |i|
            h[self[i]] += 1
        end
        h
    end

    def my_count(val)
        count = 0
        (0...self.length).each do |i|
            count += 1 if self[i] == val
        end
        count
    end

    def my_index(val)
        (0...self.length).each do |i|
            return i if self[i] == val
        end
        nil
    end

    def my_uniq
        h = Hash.new { |h, k| h[k] = 0 }
        (0...self.length).each do |i|
            h[self[i]] += 1
        end
        a = []
        h.each_key { |k| a << k }
        a
    end

    def my_transpose
        a = Array.new(self[0].length) { Array.new }
        (0...self.length).each do |i|
            (0...self[i].length).each do |j|
                a[j] << self[i][j]
            end
        end
        a
    end

end