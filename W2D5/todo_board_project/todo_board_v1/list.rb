require './item.rb'

class List

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, description = '')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return (0 <= index && index < @items.length)
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts '-------------------------------------------'
        puts '                 GROCERIES                 '
        puts '-------------------------------------------'
        puts 'Index | Item                  | Deadline   '
        puts '-------------------------------------------'
        @items.each_with_index do |item, i|
            puts "#{i}     | #{item.title.ljust(21)} | #{item.deadline} "
        end
        puts '-------------------------------------------'
    end

    def print_full_item(index)
        if valid_index?(index)
            item = @items[index]
            puts '-------------------------------------------'
            puts item.title.ljust(33) + item.deadline
            puts item.description
            puts '-------------------------------------------'
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index > 0
            @items[index], @items[index - 1] = @items[index - 1], @items[index]
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index < @items.length - 1
            @items[index], @items[index + 1] = @items[index + 1], @items[index]
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

end