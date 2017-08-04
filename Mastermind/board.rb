class Board

	attr_accessor :code, :colors

	def initialize
		@code = []
		@colors = [:red,:blue,:yellow,:green,:cyan,:white, :black]
		generate_code(4)
	end

	def generate_code(length)
		length.times do
			color = @colors.sample
			@code.push(color)
		end	
	end

	def display_code(input_code)
		input_code.each do |color|
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
			end	
		end
	end

	def reveal_answer
		display_code(@code)
	end

	def check_code(guess)
		feedback = []

		guess.each_with_index do |g, ind|
			if g == @code[ind]
				feedback.push(:black)
			elsif @code.include?(g)
				if @code.count(g) == feedback.count(g)
					feedback.push(:blank)
				else
					feedback.push(:white)
				end
			else
				feedback.push(:blank)
			end
		end
		feedback
	end
end