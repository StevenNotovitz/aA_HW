class Board

    def initialize
        @board = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        (0 <= position[0] && position[0] < @board.length) && (0 <= position[1] && position[1] < @board.length)
    end

    def empty?(position)
        @board[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise RuntimeError.new 'Out of bounds'
        elsif !empty?(position)
            raise RuntimeError.new 'Position not vacant'
        end
        @board[position[0]][position[1]] = mark
    end

    def print
        @board.each do |row|
            puts row.join(' ')
        end
    end

    def win_row?(mark)
        (0...@board.length).each do |i|
            count = 0
            (0...@board[i].length).each do |j|
                count += 1 if @board[i][j] == mark
                return true if count == @board.length
            end
            count = 0
        end
        false
    end

    def win_col?(mark)
        (0...@board.length).each do |j|
            count = 0
            (0...@board[0].length).each do |i|
                count += 1 if @board[i][j] == mark
                return true if count == @board[0].length
            end
            count = 0
        end
        false
    end

    def win_diagonal?(mark)
        count = 0
        (0...@board.length).each do |i|
            count += 1 if @board[i][i] == mark
            return true if count == @board.length
        end
        count = 0
        (0...@board.length).each do |j|
            count += 1 if @board[@board.length - 1 -j][j] == mark
            return true if count == @board.length
        end
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end
        
    def empty_positions?
        @board.flatten.any? { |ele| ele == '_' }
    end
    
end