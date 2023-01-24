require_relative "board"
require_relative "human_player"

class Game

    def initialize(n, *marks)
        @board = Board.new(n)
        @players = []
        (0...marks.length).each { |i| @players << HumanPlayer.new(marks[i]) }
        @current_player = @players[0]
    end

    def switch_turn
        index_of_current_player = @players.index(@current_player)
        @current_player = @players[(index_of_current_player + 1) % @players.length]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory for #{@current_player.mark}"
                return
            end
            self.switch_turn
        end
        puts 'draw'
    end

end