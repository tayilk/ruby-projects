class Board

	attr_accessor :spaces

	def initialize()
		@spaces = Array.new(9)
		@spaces.fill(" ")
	end

	def draw_board
		count = 1
		@spaces.each do |space|
			if(count % 3 == 0)
				print "#{space}\n"
				puts "-----" unless count == 9
			else
				print "#{space}|"
			end
			count += 1
		end
	end

	def put_symbol(space, symbol)
		if @spaces[space] == " "
			@spaces[space] = symbol
		else
			puts "That space has already been played"
		end
	end

	def reset
		@spaces.fill(" ")
	end

end