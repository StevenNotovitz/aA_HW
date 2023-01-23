class Circle

    def initialize(radius)
        @radius = radius
    end

    def radius
        @radius
    end

    def area
        6.28 * (@radius ** 2) / 2
    end

    def circumference
        6.28 * @radius
    end

end