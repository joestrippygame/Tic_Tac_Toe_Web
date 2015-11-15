class TicTacToe

	attr_accessor :board, :player1, :player2, :current, :type

	def initialize
		@board = ["1","2","3","4","5","6","7","8","9"]
		@player1 = ""
		@player2 = ""
		@current = 1
		@type = ""
	end
	
	def marker_valid?(p1)
		p1 == "X" || p1 == "O"
	end
	
	def p2(p1)
		p1 == "X" ? "O" : "X"
	end
	
	def current_player
		current == 1 ? player1 : player2
	end
	
	def computer_move(board)
		n = rand(1..9)
		if square_valid?(n,board) == false
			computer_move(board)
		else
			player_marker = current_player()
			board[n - 1] = player_marker
		end
	end
	
	def change
		current == 1 ? current = 2 : current = 1
	end
	
	def square_valid?(choice, squares)
		choice >= 1 && choice <= 9 && squares[choice - 1] != "X" && squares[choice - 1] != "O"
	end
	
	def board_full?(squares)
		board = squares.join(",")
		board =~ (/\d/) ? false : true
	end

	def win?(board)
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