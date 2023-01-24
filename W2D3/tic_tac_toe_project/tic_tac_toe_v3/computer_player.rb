class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        p = legal_positions.sample
        puts "Computer Player #{@mark} chose position #{p}"
        p
    end

end