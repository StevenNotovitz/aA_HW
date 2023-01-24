class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        begin
            puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
            position = gets.chomp.split(' ').map { |ele| ele.to_i }
            raise RuntimeError.new "#{position} is not a legal position" if !legal_positions.include?(position)
        rescue
            retry
        end
        position
    end

end