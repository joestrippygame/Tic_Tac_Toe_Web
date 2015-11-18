class TicTacToe

	attr_accessor :board, :player1, :player2, :current, :type

	def initialize
		@board = ["1","2","3","4","5","6","7","8","9"]
		@player1 = ""
		@player2 = ""
		@current = 1
		@type = ""
	end
	
	def p2
		player1 == "X" ? "O" : "X"
	end
	
	def current_player
		current == 1 ? player1 : player2
	end
	
	def computer_move
		# n = 3 if board[0] == player2 && board[1] == player2
		# n = 9 if board[0] == player2 && board[4] == player2
		n = rand(1..9)
		if square_available?(n) == false
			computer_move()
		else
			player_marker = current_player()
			board[n - 1] = player_marker
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

	def win?
		if board[0] == "X" && board[1] == "X" && board[2] == "X" ||
		board[3] == "X" && board[4] == "X" && board[5] == "X" ||
		board[6] == "X" && board[7] == "X" && board[8] == "X" ||
		board[0] == "X" && board[3] == "X" && board[6] == "X" ||
		board[1] == "X" && board[4] == "X" && board[7] == "X" ||
		board[2] == "X" && board[5] == "X" && board[8] == "X" ||
		board[0] == "X" && board[4] == "X" && board[8] == "X" ||
		board[2] == "X" && board[4] == "X" && board[6] == "X" ||
		board[0] == "O" && board[1] == "O" && board[2] == "O" ||
		board[3] == "O" && board[4] == "O" && board[5] == "O" ||
		board[6] == "O" && board[7] == "O" && board[8] == "O" ||
		board[0] == "O" && board[3] == "O" && board[6] == "O" ||
		board[1] == "O" && board[4] == "O" && board[7] == "O" ||
		board[2] == "O" && board[5] == "O" && board[8] == "O" ||
		board[0] == "O" && board[4] == "O" && board[8] == "O" ||
		board[2] == "O" && board[4] == "O" && board[6] == "O"
			true
		else 
			false
	end
end

end


#winning_routes = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]