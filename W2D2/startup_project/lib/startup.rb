require "employee"

class Startup
    
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    attr_reader :name, :funding, :salaries, :employees
    
    def valid_title?(title)
        @salaries.include?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(name, title)
        if !valid_title?(title)
            raise ArgumentError.new "Invalid Title"
        else
            @employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding < @salaries[employee.title]
            raise ArgumentError.new "insufficient funds to pay employee"
        else
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
            if !@salaries.include?(title)
                @salaries[title] = salary
            end
        end
        startup.employees.each do |employee|
            @employees << employee
        end
        startup.close
    end

end
