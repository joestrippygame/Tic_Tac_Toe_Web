class Players
	attr_accessor :player1, :player2, :current
	
	def initialize
		@player1 = ""
		@player2 = ""
		@current = 1
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
	
	def change
		current == 1 ? current = 2 : current = 1
	end
end

class Board
	attr_accessor :board, :winning_routes, :fork_routes

	def initialize
		@board = ["1","2","3","4","5","6","7","8","9"]
		@winning_routes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		@fork_routes = [[0,2,6],[0,2,8],[0,6,8],[2,6,8],[0,2,5],[0,2,3],[5,6,8],[3,6,8],[0,2,4],[2,4,8],[0,4,6],[6,4,8]]
	end
	
	def square_available?(choice)
		board[choice] != "X" && board[choice] != "O"
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

class AI
	attr_accessor :type, :level

	def initialize
		@type = ""
		@level = ""
	end
	
	def computer_move(level)
		case level
			when "easy"
			computer_random_move()
			
			when "medium"
			if computer_winning_move()
			elsif computer_blocking_move()
			elsif computer_fork_move()
			elsif computer_fork_block()
			elsif @medium_move = computer_random_move()
			end
			return @medium_move
			
			when "hard"
			depth = 1
			player_marker = current_player()
			negamax(board, player_marker, depth)
			return @best_move
		end
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
						# board[value] = player_marker
						@medium_move = value
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
		move = false
		winning_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if board[value] != "X" && board[value] != "O"
						# board[value] = player_marker
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
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
						# board[value] = player_marker
						@medium_move = value
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
		move = false
		fork_routes.each do |group|
		count = 0
			group.each do |value|
				count += 1 if board[value] == opponent
			end
			
			if count == 2
				group.each do |value|
					if board[value] != "X" && board[value] != "O"
						# board[value] = player_marker
						@medium_move = value
						move = true
					end
				end
			end
		break if move == true
		end
		move
	end
	
	def computer_random_move
		n = rand(0..8)
			if square_available?(n) == false
				computer_random_move()
			else
				return n
			end
	end
end