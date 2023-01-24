require_relative "room"

class Hotel
    
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        n = []
        words = @name.split(' ')
        words.each { |word| n << word.capitalize }
        n.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.include?(room)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts "sorry, room does not exist"
        else
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.any? { |k, v| !v.full? }
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + ".*" + v.available_space.to_s
        end
    end

end