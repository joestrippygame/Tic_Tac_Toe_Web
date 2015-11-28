class TicTacToe

	attr_accessor :board, :player1, :player2, :current, :type, :winning_routes

	def initialize
		@board = ["1","2","3","4","5","6","7","8","9"]
		@player1 = ""
		@player2 = ""
		@current = 1
		@type = ""
		@winning_routes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	end
	
	def p2
		player1 == "X" ? "O" : "X"
	end
	
	def current_player
		current == 1 ? player1 : player2
	end
	
	def opposite_player
		current == 1 ? player2 : player1
	end
	
	def computer_winning_move
		player_marker = current_player()
		move = false
		winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if board[value] == player_marker
			end
			
			if count == 2
				group.each do |value|
					if board[value] != "X" && board[value] != "O"
						board[value] = player_marker
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_blocking_move
		player_marker = current_player()
		opponent = opposite_player()
		moved = false
		winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if board[value] != "X" && board[value] != "O"
						board[value] = player_marker
						moved = true
					end
				end
			end
		break if moved == true
		end
		moved
	end
	
	def computer_random_move
		n = rand(1..9)
			if square_available?(n) == false
				computer_move()
			else
				player_marker = current_player()
				board[n - 1] = player_marker
			end
	end
	
	def computer_move
		if computer_winning_move()
		elsif computer_blocking_move()
		else computer_random_move()
		end
	end
	
	def change
		current == 1 ? current = 2 : current = 1
	end
	
	def square_available?(choice)
		board[choice - 1] != "X" && board[choice - 1] != "O"
	end
	
	def board_full?
		board_tos = board.join(",")
		board_tos =~ (/\d/) ? false : true
	end
	
	def winner?
		result = false
		marker = current_player()
		winning_routes.each do |group|
			if board[group[0]] == marker && board[group[1]] == marker && board[group[2]] == marker
				result = true
			end
		end
		result
	end

end