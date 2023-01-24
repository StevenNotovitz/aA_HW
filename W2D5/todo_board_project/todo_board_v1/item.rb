class Item
    
    def Item.valid_date?(date)
        nums = '1234567890'
        return false if !date.is_a?(String)
        return false if date.length != 10
        (0..3).each { |i| return false if !nums.include?(date[i]) }
        return false if date[4] != '-'
        (5..6).each { |i| return false if !nums.include?(date[i]) }
        return false if !(1 <= date[5..6].to_i && date[5..6].to_i <= 12)
        return false if date[7] != '-'
        (8..9).each { |i| return false if !nums.include?(date[i]) }
        return false if !(1 <= date[8..9].to_i && date[8..9].to_i <= 31)
        if date[5..6] == '04' || date[5..6] == '06' || date[5..6] == '09' || date[5..6] == '11'
            return false if date[8..9].to_i > 30
        end
        if date[5..6] == '02'
            if (date[0..3].to_i % 4 == 0)
                if date[0..3].to_i % 100 == 0
                    if date[0..3].to_i % 400 == 0
                        return false if date[8..9].to_i > 29
                    end
                    return false if date[8..9].to_i > 28
                end
                return false if date[8..9].to_i > 29
            end
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        elsif
            raise('deadline is not valid')
        end
        @description = description
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        elsif
            raise('deadline is not valid')
        end
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

end