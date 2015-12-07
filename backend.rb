class TicTacToe

	attr_accessor :board, :player1, :player2, :current, :type, :winning_routes, :fork_routes, :level

	def initialize
		@board = ["1","2","3","4","5","6","7","8","9"]
		@player1 = ""
		@player2 = ""
		@current = 1
		@type = ""
		@level = ""
		@winning_routes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		@fork_routes = [[0,2,6],[0,2,8],[0,6,8],[2,6,8],[0,2,5],[0,2,3],[5,6,8],[3,6,8],[0,2,4],[2,4,8],[0,4,6],[6,4,8]]
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
	
	def negamax(board, mark, depth)
		mark == "O" ? opponent = "X" : opponent = "O"
		if winner?(mark) || board_full?()
			return game_result(mark, opponent)
		else 
			max = -1.0/0
			available_moves.each do |space|
				board[space] = mark
				score = -negamax(board, opponent, depth + 1)
				board[space] = "#{space + 1}"
				if score > max
					max = score
					if depth == 1
					@best_move = space
					end
				end
			end
			return max
		end
	end
	
	def available_moves()
		board.each_index.select { |s| board[s] != "X" && board[s] != "O"}
	end
	
	def game_result(mark, opponent)
		if winner?(mark)
			return 1
		elsif winner?(opponent)
			return -1
		else 
			return 0
		end
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
	
	def computer_fork_move
		player_marker = current_player()
		move = false
		fork_routes.each do |group|
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
	
	def computer_fork_block
		player_marker = current_player()
		opponent = opposite_player()
		moved = false
		fork_routes.each do |group|
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
	
	def computer_move_center
		player_marker = current_player()
		board[4] = player_marker if board[4] == "5"
	end
	
	def computer_move_opposite_corner
		opposite_corners = [[0,8],[2,6]]
		player_marker = current_player()
		opponent = opposite_player()
		opposite_corners.each do |group|
			if board[group[0]] == opponent && square_available?(group[1])
				board[group[1]] = player_marker
			elsif board[group[1]] == opponent && square_available?(group[0])
				board[group[0]] = player_marker
			end
		end
	end
	
	def computer_move_empty_corner
		empty_corners = [0,2,6,8]
		corner_move = empty_corners.sample
			if square_available?(corner_move) == false
				computer_move_empty_corner()
			else
				player_marker = current_player()
				board[corner_move] = player_marker
			end
	end
	
	def computer_move_empty_side
		empty_sides = [1,3,5,7]
		side_move = empty_sides.sample
			if square_available?(side_move) == false
				computer_move_empty_side()
			else
				player_marker = current_player()
				board[side_move] = player_marker
			end
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
	
	# def computer_move
		# if computer_winning_move()
		# elsif computer_blocking_move()
		# elsif computer_fork_move()
		# elsif computer_fork_block()
		# elsif computer_move_center()
		# elsif computer_move_opposite_corner()
		# elsif computer_move_empty_corner()
		# else computer_move_empty_side()
		# end
	# end
	
	def computer_move(level)
		case level
			when "easy"
			computer_random_move()
			
			when "medium"
			if computer_winning_move()
			elsif computer_blocking_move()
			elsif computer_fork_move()
			elsif computer_fork_block()
			elsif computer_random_move()
			end
			
			when "hard"
			depth = 1
			player_marker = current_player()
			negamax(board, player_marker, depth)
			return @best_move
			# board[@best_move] = player_marker
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
	
	def winner?(player)
		result = false
		winning_routes.each do |group|
			if board[group[0]] == player && board[group[1]] == player && board[group[2]] == player
				result = true
			end
		end
		result
	end

end