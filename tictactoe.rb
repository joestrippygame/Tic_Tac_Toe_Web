require 'sinatra'
require_relative "backend.rb"

game = TicTacToe.new(["1","2","3","4","5","6","7","8","9"],"","",1)

get '/tictactoe' do
	erb :tictactoe, :locals => {:error => "", :board => game.board}
end

post '/tictactoe' do
	choice = params[:GameType].to_i
	
	if choice == 1
		erb :cputictactoe, :locals => {:error => "", :board => game.board}
	else
		erb :tptictactoe, :locals => {:error => "", :board => game.board}
	end
end

post '/2ptictactoe' do
	game.player1 = params[:XorO].upcase

	if game.marker_valid?(game.player1) == true
		game.player2 = game.p2(game.player1)
		erb :tpsquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
								  :p2 => " and Player 2 is: ", :p2a => game.player2, 
								  :current => game.current, 
								  :error => "", :error2 => "", 
								  :board => game.board}
	else
		erb :tptictactoe, :locals => {:error => "Please choose X or O", :board => game.board}
	end
end

post '/cputictactoe' do
	game.player1 = params[:XorO].upcase

	if game.marker_valid?(game.player1) == true
		game.player2 = game.p2(game.player1)
		erb :cpusquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
								  :p2 => " and Player 2 is: ", :p2a => game.player2, 
								  :current => game.current, 
								  :error => "", :error2 => "", 
								  :board => game.board}
	else
		erb :cputictactoe, :locals => {:error => "Please choose X or O", :board => game.board}
	end
end

post '/2pgame' do

	choice = params[:square].to_i
	
	player_marker = game.current_player()
	
		if game.square_valid?(choice, game.board) == true
			game.board[choice - 1] = player_marker
			
			if game.board_full?(game.board) == false && game.win?(game.board) == false
				game.current = game.change()
					
				erb :tpsquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
										  :p2 => " and Player 2 is: ", :p2a => game.player2, 
										  :error => "", :error2 => "", 
										  :current => game.current, :board => game.board}
										  
			elsif game.win?(game.board) == true
	
				erb :gameover, :locals => {:p1 => "Player #{game.current} wins!!!", :board => game.board}
		
			elsif game.board_full?(game.board) == true
	
				erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
		
			end
		
		else
			if choice == 0
				erb :tpsquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
										  :p2 => " and Player 2 is: ", :p2a => game.player2, 
										  :error => "Please choose 1 - 9", 
										  :error2 => "", 
										  :current => game.current, :board => game.board}
			else
				erb :tpsquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
										  :p2 => " and Player 2 is: ", :p2a => game.player2, 
										  :error => "#{choice} is already taken", 
										  :error2 => "Please choose again.", 
										  :current => game.current, :board => game.board}
			end
		end	
end

post '/cpugame' do

	choice = params[:square].to_i
	
	player_marker = game.current_player()
	
		if game.square_valid?(choice, game.board) == true
			game.board[choice - 1] = player_marker
			
			if game.board_full?(game.board) == false && game.win?(game.board) == false
				game.current = game.change()
				game.computer_move(game.board)
				game.current = game.change()
				
					if game.board_full?(game.board) == false && game.win?(game.board) == false
						erb :cpusquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
												  :p2 => " and Player 2 is: ", :p2a => game.player2, 
												  :error => "", :error2 => "", 
												  :current => game.current, :board => game.board}
												  
					elsif game.win?(game.board) == true
	
						erb :gameover, :locals => {:p1 => "The Computer wins!!!", :board => game.board}
		
					elsif game.board_full?(game.board) == true
	
						erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
		
					end
										  
			elsif game.win?(game.board) == true
	
				erb :gameover, :locals => {:p1 => "Player 1 wins!!!", :board => game.board}
		
			elsif game.board_full?(game.board) == true
	
				erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
		
			end
		
		else
			if choice == 0
				erb :cpusquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
										  :p2 => " and Player 2 is: ", :p2a => game.player2, 
										  :error => "Please choose 1 - 9", 
										  :error2 => "", 
										  :current => game.current, :board => game.board}
			else
				erb :cpusquares, :locals => {:p1 => "Player 1 is: ", :p1a => game.player1, 
										  :p2 => " and Player 2 is: ", :p2a => game.player2, 
										  :error => "#{choice} is already taken", 
										  :error2 => "Please choose again.", 
										  :current => game.current, :board => game.board}
			end
		end	
end

post '/new' do

	game = TicTacToe.new(["1","2","3","4","5","6","7","8","9"],"","",1)
	redirect to('/tictactoe')

end