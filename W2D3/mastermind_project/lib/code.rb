class Code

    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }
    
    def Code.valid_pegs?(chars)
        (0...chars.length).each do |i|
            return false if !POSSIBLE_PEGS.include?(chars[i].upcase)
        end
        true
    end

    def initialize(chars)
        @pegs = []
        (0...chars.length).each do |i|
            @pegs << chars[i].upcase
        end
        raise "error" if !Code.valid_pegs?(@pegs)
    end

    def pegs
        @pegs
    end

    def Code.random(length)
        keys = []
        POSSIBLE_PEGS.each { |k, v| keys << k }
        chars = []
        while length > 0
            chars << keys.sample
            length -= 1
        end
        Code.new(chars)
    end

    def Code.from_string(str)
        Code.new(str.split(''))
    end

    def [](idx)
        pegs[idx]
    end

    def length
        pegs.length
    end

    def num_exact_matches(code)
        count = 0 
        (0...pegs.length).each do |i|
            count += 1 if code[i] == pegs[i]
        end
        count
    end

    def num_near_matches(guess_code)
        code_dup = self.pegs.dup
        guess_dup = guess_code.pegs.dup
    
        guess_dup.each_with_index do |peg, i|
          if peg == code_dup[i]
            code_dup[i] = nil
            guess_dup[i] = nil
          end
        end
        code_dup.delete(nil)
        guess_dup.delete(nil)
    
        count = 0
        guess_dup.each_with_index do |peg, i|
          if code_dup.include?(peg)
            count += 1
            code_dup.delete_at(code_dup.index(peg))
          end
        end
        count
    end

    # def num_near_matches(code)
    #     code_dup = code.pegs.dup
    #     pegs_dup = pegs.dup

    #     (0...code_dup.length).each do |i|
    #         if code_dup[i] == pegs_dup[i]
    #             code_dup[i] = nil
    #             pegs_dup[i] = nil
    #         end
    #     end
    #     code_dup.delete(nil)
    #     pegs_dup.delete(nil)

    #     count = 0
    #     (0...code_dup.length).each do |i|
    #         if pegs_dup.include?(code_dup[i])
    #             count += 1
    #             pegs_dup.delete_at(i)
    #         end
    #     end
    #     count
    # end

    # def num_near_matches(code)
    #     code_count = Hash.new(0)
    #     (0...code.length).each do |i|
    #         code_count[code[i]] += 1
    #     end
    #     pegs_count = Hash.new(0)
    #     (0...pegs.length).each do |j|
    #         pegs_count[pegs[j]] += 1
    #     end
    #     count = 0
    #     code_count.each do |k, v|
    #         count += v if pegs_count.include?(k)
    #     end
    #     if num_exact_matches(code) != 0
    #         return count - num_exact_matches(code) - 1
    #     end
    #     count
    # end

    def ==(code)
        code == pegs
    end

end