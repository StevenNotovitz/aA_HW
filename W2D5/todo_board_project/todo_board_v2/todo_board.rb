require './item.rb'
require './list.rb'

class TodoBoard

    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, list, *args = gets.chomp.split(' ')

        case cmd
        when 'ls'
            @lists.each_key { |list| puts list }
        when 'showall'
            @lists.each_value { |value| value.print }
        when 'mklist'
            @lists[list] = List.new(list)
        when 'mktodo'
            @lists[list].add_item(*args)
        when 'toggle'
            @lists[list].toggle_item!(args[0].to_i)
        when 'rm'
            @lists[list].remove_item!(args[0].to_i)
        when 'purge'
            @lists[list].purge!
        when 'up'
            @lists[list].up(*args.map { |arg| arg.to_i} )
        when 'down'
            @lists[list].down(*args.map { |arg| arg.to_i} )
        when 'swap'
            @lists[list].swap(*args.map { |arg| arg.to_i} )
        when 'sort'
            @lists[list].sort_by_date!
        when 'priority'
            @lists[list].print_priority
        when 'print'
            @lists[list].print if args.length == 0
            @lists[list].print_full_item(args[0].to_i) if args.length == 1
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end

end

TodoBoard.new.run