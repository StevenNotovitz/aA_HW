require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game

    def initialize(n, hash)
        @board = Board.new(n)
        @players = []
        hash.each do |mark, v|
            @players << HumanPlayer.new(mark) if !hash[mark]
            @players << ComputerPlayer.new(mark) if hash[mark]
        end
        @current_player = @players[0]
    end

    def switch_turn
        index_of_current_player = @players.index(@current_player)
        @current_player = @players[(index_of_current_player + 1) % @players.length]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "victory for #{@current_player.mark}"
                return
            end
            self.switch_turn
        end
        puts 'draw'
    end

end