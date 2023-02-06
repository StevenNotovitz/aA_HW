school = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh'] # => "fiiiissshhhhhh"

def sluggish_octopus(school)
    school.each_with_index do |fish_1|
        biggest = true
        school.each_with_index do |fish_2|
            biggest = false if fish_2.size > fish_1.size
        end
        return fish_1 if biggest
    end
end

class Array

    def merge_sort
        return self if size < 2
        i = length / 2
        left = self[0...i].merge_sort
        right = self[i..-1].merge_sort
        self.class.merge(left, right)
    end

    private

    def self.merge(left, right)
        merged = []
        until left.empty? || right.empty?
            left.first.size < right.first.size ? merged << left.shift : merged << right.shift
        end
        merged + left + right
    end

end

def dominant_octopus(school)
    school.merge_sort[-1]
end

def clever_octopus(school)
    biggest = school[0]
    school.each { |fish| biggest = fish if fish.size > biggest.size }
    biggest
end

tiles_array = [
    "up",
    "right-up",
    "right",
    "right-down",
    "down",
    "left-down",
    "left",
    "left-up"
]

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def slow_dance(dir, tiles_array)
    tiles_array.index(dir)
end

def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end