require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.new(Code.random(length))
    end

    def print_matches(code)
        puts 'exact matches:' + @secret_code.num_exact_matches(code).to_s
        puts 'near matches: ' + @secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        print 'Enter a code: '
        guess = Code.from_string(gets.chomp)
        self.print_matches(guess)
        guess == @secret_code
    end

end