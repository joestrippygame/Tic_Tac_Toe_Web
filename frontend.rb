require 'sinatra'
require 'tilt/erb'
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
	game.player1 = params[:XorO]
	game.player2 = game.p2()
	erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
							  :error => "", :error2 => "", 
							  :current => game.current, :board => game.board}
end

post '/game' do
	choice = params[:square].to_i
	player_marker = game.current_player()
	
	if game.square_available?(choice) == true
		game.board[choice - 1] = player_marker
		redirect to('/status')
	else
		erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
								  :error => "#{choice} is already taken", :error2 => "Please choose again.", 
								  :current => game.current, :board => game.board}
	end	
end

get '/cpu' do
	game.computer_move()
	redirect to('/status')
end

get '/status' do
	if game.winner?() == true
		redirect to('/win')
	elsif game.board_full?() == true
		redirect to('/tie')
	end
	
	game.current = game.change()
	redirect to('/cpu') if game.type == "1" && game.current == 2
	erb :squares, :locals => {:p1 => game.player1, :p2 => game.player2, 
							  :error => "", :error2 => "", 
							  :current => game.current, :board => game.board}	
end

get '/win' do
	erb :gameover, :locals => {:p1 => "Player #{game.current} wins!!!", :board => game.board}
end

get '/tie' do
	erb :gameover, :locals => {:p1 => "It's a tie.", :board => game.board}
end

post '/new' do
	game = TicTacToe.new()
	redirect to('/tictactoe')
end