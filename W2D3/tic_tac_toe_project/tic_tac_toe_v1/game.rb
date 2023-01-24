require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        elsif @current_player == @player_2
            @current_player = @player_1
        end
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