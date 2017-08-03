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

	def display_code
		@code.each do |color|
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
			end	
		end
	end

end