require 'sinatra'
require_relative "web.rb"



get '/tictactoe' do
board_positions_array=board_positions
erb :tictactoe, :locals => {:p1 => "", :p2 => "", :error => "", :board => board_positions_array}

end


post '/tictactoe' do
board_positions_array=board_positions
player1 = params[:XorO].upcase
	if marker_valid?(player1) == true
		player2 = player2(player1)
		erb :tictactoe, :locals => {:p1 => "Player 1 is: #{player1}", :p2 => " and Player 2 is: #{player2}", :error => "", :board => board_positions_array}
	else
		erb :tictactoe, :locals => {:p1 => "", :p2 => "", :error => "Please choose X or O", :board => board_positions_array}
	end
end

