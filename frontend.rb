require 'sinatra'
require 'tilt/erb'
require_relative "board.rb"
require_relative "players.rb"
require_relative "ai.rb"

game_board = Board.new()
players = Players.new()
ai = AI.new()

get '/tictactoe' do
	erb :gametype, :locals => {:error => "", :board => game_board.board}
end

post '/tictactoe' do
	players.type = params[:GameType]
	if players.type == "1"
		erb :level, :locals => {:error => "", :board => game_board.board}
	else
		erb :marker, :locals => {:error => "", :board => game_board.board}
	end
end

post '/marker' do
		ai.level = params[:level] if players.type == "1"
		puts "ai initialization"
	erb :marker, :locals => {:error => "", :board => game_board.board}
end

post '/squares' do
	players.player1 = params[:XorO]
	players.player2 = players.p2()
	erb :squares, :locals => {:p1 => players.player1, :p2 => players.player2, 
							  :error => "", :error2 => "", 
							  :current => players.current, :board => game_board.board, :type => players.type}
end

post '/game' do
	choice = params[:square].to_i
	player_marker = players.current_player()
	
	if game_board.square_available?(choice - 1) == true
		game_board.board[choice - 1] = player_marker
		redirect to('/status')
	else
		erb :squares, :locals => {:p1 => players.player1, :p2 => players.player2, 
								  :error => "#{choice} is already taken", :error2 => "Please choose again.", 
								  :current => players.current, :board => game_board.board, :type => players.type}
	end	
end

get '/cpu' do
	sleep 1
	player_marker = players.current_player()
	move = ai.computer_move(ai.level)
	game_board.board[move] = player_marker
	redirect to('/status')
end

get '/status' do
	if game_board.winner?(players.current_player) == true
		redirect to('/win')
	elsif game_board.board_full?() == true
		redirect to('/tie')
	end
	
	players.current = players.change()
	redirect to('/cpu') if players.type == "1" && players.current == 2
	erb :squares, :locals => {:p1 => players.player1, :p2 => players.player2, 
							  :error => "", :error2 => "", 
							  :current => players.current, :board => game_board.board, :type => players.type}	
end

get '/win' do
	erb :gameover, :locals => {:p1 => "Player #{players.current} wins!!!", :board => game_board.board}
end

get '/tie' do
	erb :gameover, :locals => {:p1 => "It's a tie.", :board => game_board.board}
end

post '/new' do
	game_board = Board.new()
	players = Players.new()
	redirect to('/tictactoe')
end