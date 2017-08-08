load './board.rb'

puts "Mastermind"

our_board = Board.new()

stop = false

def get_guess
	guess = gets.chomp.split('').collect{|i| i.to_i}
	guess
end

until stop
	our_board.display_choices

	guess = get_guess
	stop = our_board.recieve_guess(guess)
end

