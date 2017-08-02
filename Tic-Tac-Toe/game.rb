class Game
	load './board.rb'
	load './player.rb'

	attr_accessor :players, :win_combos, :board, :played_spaces, :p1_spaces, :p2_spaces

	def initialize(p1_name, p2_name)
		@players = []
		p1 = Player.new(p1_name, 'X')
		p2 = Player.new(p2_name, 'O')
		@players.push(p1)
		@players.push(p2)

		@win_combos = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],
		[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
		@p1_spaces = []
		@p2_spaces = []
		@played_spaces = []
		@board = Board.new()
	end

	def start
		puts "TIC-TAC-TOE"
		puts "Spaces are numbered from top left to bottom right, 
		starting with the number '0'."

		go = true

		p1 = @players[0]
		p2 = @players[1]

		while go

			if determine_win != 0
				puts "Do you want to play again? (Y/N)"
				choice = gets.chomp
				if choice == 'n' || choice == 'N'
					go = false
				else
					self.reset_game
				end
			end

			@board.draw_board()
			puts "#{p1.name}, please select an open space."
			get_choice(1)
			if determine_win == 1
				puts "#{p1.name} wins!" 
				p1.games_won += 1
				next
			end

			@board.draw_board()
			puts "#{p2.name}, please select an open space."
			get_choice(2)
			if determine_win == 2
				puts "#{p2.name} wins!"
				p2.games_won += 1
				next
			end
		end
	end

	## returns 0 if no win, 1 if p1 wins, 2 if p2 wins
	def determine_win
		@win_combos.each do |combo|
			p1 = (@p1_spaces & combo).length
			p2 = (@p2_spaces & combo).length

			if p1 == 3
				return 1
			elsif p2 == 3
				return 2
			end
		end
		0
	end

	def get_choice(player)
		chosen = false
		choice = gets.chomp.to_i

		until chosen

			if @played_spaces.include?(choice)
				puts "That space has already been chosen. Choose a different space."
				choice = gets.chomp.to_i
			else
				@played_spaces.push(choice)
				if player == 1
					@p1_spaces.push(choice)
					@board.put_symbol(choice, @players[0].symbol)
				elsif player == 2
					@p2_spaces.push(choice)
					@board.put_symbol(choice, @players[1].symbol)
				end
				chosen = true
			end
		end
	end

	def reset_game
		@p1_spaces = []
		@p2_spaces = []
		@played_spaces = []
		@board = Board.new()
	end
					
end