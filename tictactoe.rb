require 'sinatra'
require_relative "web.rb"

get '/tictactoe' do
squares = ["1","2","3","4","5","6","7","8","9"]
erb :tictactoe, :locals => {:p1 => "", :p2 => "", :error => "", :board => squares}

end

post '/tictactoe' do
squares = ["1","2","3","4","5","6","7","8","9"]
p1 = params[:XorO].upcase
@@player1 = p1
	if marker_valid?(p1) == true
		p2 = player2(p1)
		@@player2 = p2
		erb :squares, :locals => {:p1 => "Player 1 is: #{p1}", :p2 => " and Player 2 is: #{p2}", :p => 1, :error => "", :board => squares}
	else
		erb :tictactoe, :locals => {:p1 => "", :p2 => "", :error => "Please choose X or O", :board => squares}
	end

end

post '/game' do
	squares = ["1","2","3","4","5","6","7","8","9"]
	cp = 1
	choice = params[:square].to_i
	
#while board_full?(squares) == false || win(squares) == false
	cp = 1 ? current = @@player1 : current = @@player2
	if square_valid?(choice, squares) == true
		squares[choice - 1] = current
		erb :squares, :locals => {:p1 => choice, :p2 => squares, :error => "", :board => squares}
	else
		erb :squares, :locals => {:p1 => "", :p2 => "", :error => "Please choose 1-9", :board => squares}
	end
		
	current = player_changer(cp)
#end
	
end