class Player

	attr_accessor :name, :games_won, :symbol

	def initialize(name, symbol)
		@name = name
		@games_won = 0
		@symbol = symbol
	end

	def name
		@name
	end

	def games_won
		@games_won
	end

	def symbol
		@symbol
	end

end