class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def size
        @size
    end

    def [](position)
        @grid[position[0]][position[1]]
    end

    def []=(position, val)
        @grid[position[0]][position[1]] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        end
        self[position] = :X
        false
    end

    def place_random_ships
        while num_ships < @size / 4
            p = [rand(0...@grid.length), rand(0...@grid[0].length)]
            self[p] = :S
        end
    end

    def hidden_ships_grid
        a = Array.new(@grid.length) { [] }
        (0...@grid.length).each do |i|
            (0...@grid[i].length).each do |j|
                @grid[i][j] == :S ? a[i] << :N : a[i] << @grid[i][j]
            end
        end
        a
    end

    def self.print_grid(grid)
        grid.each { |row| puts row.join(' ') }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end