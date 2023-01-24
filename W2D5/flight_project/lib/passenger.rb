class Passenger

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    # attr_reader :flight_numbers
    # attr_writer :name, :flight_numbers

    def has_flight?(flight_number)
        @flight_numbers.include?(flight_number.upcase)
    end

    def add_flight(flight_number)
        @flight_numbers << flight_number.upcase if !self.has_flight?(flight_number.upcase)
    end

end