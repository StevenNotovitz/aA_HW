class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        position = gets.chomp.split(' ').map { |ele| ele.to_i }
        raise RuntimeError.new 'sorry, that was invalid' if position.length != 2
        position
    end

end