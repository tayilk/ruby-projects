class Board

	attr_accessor :code, :colors

	def initialize
		@code = []
		@colors = [:red,:blue,:yellow,:green,:cyan,:white]
		generate_code(4)
	end

	def generate_code(length)
		length.times do
			color = @colors.sample
			@code.push(color)
		end	
	end

	def display_choices
		puts "Please select four of the following: "
		@colors.each_with_index do |color, ind|
			print "#{ind} = "
			display_color(color)
			print " "
		end
		puts ""
	end

	def display_color(color)
		case color
		when :red
			print "\033[31m⚫\033[0m"
		when :blue
			print "\033[34m⚫\033[0m"
		when :yellow
			print "\033[33m⚫\033[0m"
		when :green
			print "\033[32m⚫\033[0m"
		when :cyan
			print "\033[36m⚫\033[0m"
		when :white
			print "\033[37m⚫\033[0m"
		when :black
			print "\033[30m⚫\033[0m"
		when :blank
			print " "
		end	
	end

	def display_code(input_code)
		input_code.each do |color|
			display_color(color)
		end
	end

	def reveal_answer
		display_code(@code)
	end

	def check_code(guess)
		feedback = []
		temp = []
		@code.each{ |c| temp << c }
		guess.each_with_index do |g, ind|
			if g == @code[ind]
				feedback[ind] = :black
				temp[ind] = :erased
			elsif temp.include?(g)
				feedback[ind] = :white
				x = temp.index(g)
				temp[x] = :erased
			else
				feedback[ind] = :blank
			end
		end
		feedback
	end

	def recieve_guess(guess)
		our_guess = []

		guess.each do |g|
			case g
			when 0
				our_guess.push(:red)
			when 1
				our_guess.push(:blue)
			when 2
				our_guess.push(:yellow)
			when 3
				our_guess.push(:green)
			when 4 
				our_guess.push(:cyan)
			when 5
				our_guess.push(:white)
			end
		end
		display_code(our_guess)
		puts ""
		feedback = check_code(our_guess)
		display_code(feedback)
		puts ""
		feedback.each do |f|
			if f != :black
				return false
			end
		end
		true
	end
end