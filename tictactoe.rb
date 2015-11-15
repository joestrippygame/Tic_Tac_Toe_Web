require 'sinatra'
require_relative "backend.rb"

game = TicTacToe.new()

get '/tictactoe' do
	erb :gametype, :locals => {:error => "", :board => game.board}
end

post '/tictactoe' do
	game.type = params[:GameType]
	
	erb :marker, :locals => {:error => "", :board => game.board}
end

post '/marker' do
	game.player1 = params[:XorO].upcase

	if game.marker_valid?(game.player1) == true
		game.player2 = game.p2(game.player1)
		erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
								  :error => "", :error2 => "", 
								  :current => game.current, :board => game.board}
	else
		erb :marker, :locals => {:error => "Please choose X or O", :board => game.board}
	end
end

post '/game' do

	choice = params[:square].to_i
	
	player_marker = game.current_player()
	
		if game.square_valid?(choice, game.board) == true
			game.board[choice - 1] = player_marker
			
			if game.board_full?(game.board) == false && game.win?(game.board) == false
				game.current = game.change()
				
				if game.type == "1"
					game.computer_move(game.board) 
					if game.board_full?(game.board) == false && game.win?(game.board) == false
						puts "testing line 44"
						game.current = game.change()
						erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
												  :error => "", :error2 => "", 
												  :current => game.current, :board => game.board}
					elsif game.win?(game.board) == true
						erb :gameover, :locals => {:p1 => "Player #{game.current} wins!!!", :board => game.board}
					else
						erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
		
					end
				end
					
				erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
										  :error => "", :error2 => "", 
										  :current => game.current, :board => game.board}
										  
			elsif game.win?(game.board) == true
	
				erb :gameover, :locals => {:p1 => "Player #{game.current} wins!!!", :board => game.board}
		
			else
	
				erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
		
			end
		
		else
			if choice == 0
				erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
										  :error => "Please choose 1 - 9", :error2 => "", 
										  :current => game.current, :board => game.board}
			else
				erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
										  :error => "#{choice} is already taken", :error2 => "Please choose again.", 
										  :current => game.current, :board => game.board}
			end
		end	
end

post '/new' do

	game = TicTacToe.new()
	redirect to('/tictactoe')

end