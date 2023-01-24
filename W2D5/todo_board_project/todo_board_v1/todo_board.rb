require './item.rb'
require './list.rb'

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts 'Enter a command:'
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args.map { |arg| arg.to_i} )
        when 'down'
            @list.down(*args.map { |arg| arg.to_i} )
        when 'swap'
            @list.swap(*args.map { |arg| arg.to_i} )
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            @list.print if args.length == 0
            @list.print_full_item(args[0].to_i) if args.length !=0
        when 'quit'
            return false
        else
            puts 'Sorry, that command is not recognized.'
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end

end