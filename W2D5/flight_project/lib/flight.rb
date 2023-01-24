class Flight

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        @passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        a = []
        (0...@passengers.length).each { |i| a << @passengers[i].name }
        a
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end