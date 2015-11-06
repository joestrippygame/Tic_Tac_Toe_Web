def marker_valid?(choice)
	choice == "X" || choice == "O"
end

def player2(p1)
	p1 == "X" ? "O" : "X"
end

def square_valid?(choice, squares)
	choice >= 1 && choice <= 9 && squares[choice - 1] != "X" && squares[choice - 1] != "O"
end

def current(p)
	p == 1 ? xoro = @p1 : xoro = @p2
end

def player_changer(current)
	current == 1 ? 2 : 1
end

def board_full?(squares)
	board = squares.join(",")
	board =~ (/\d/) ? false : true
end

def win(board)
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