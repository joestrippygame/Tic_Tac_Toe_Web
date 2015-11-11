require_relative "backend.rb"
require "minitest/autorun"

class Tictactoe_test < Minitest::Test

	def test_initialize
		game = TicTacToe.new(["1","2","3","4","5","6","7","8","9"],"","",1)
	
	#test_for_initalized_instance_variables
		assert_equal(["1","2","3","4","5","6","7","8","9"], game.board)
		assert_equal("", game.player1)
		assert_equal("", game.player2)
		assert_equal(1, game.current)
		
	#test_for_marker_valid
		assert_equal(true, game.marker_valid?("O"))
		assert_equal(true, game.marker_valid?("X"))
		assert_equal(false, game.marker_valid?("Q"))
	
	#test_for_set_player_2
		assert_equal("X", game.p2("O"))
		assert_equal("O", game.p2("X"))
		
	#test_for_current_player
		assert_equal(game.player1, game.current_player)
		game.current = 2
		assert_equal(game.player2, game.current_player)
		
	#test_for_change_player
		assert_equal(1, game.change)
		game.current = 1
		assert_equal(2, game.change)
	
	#test_for_square_valid
		assert_equal(true, game.square_valid?(1,["1","2","3","4","5","6","7","8","9"]))
		assert_equal(false, game.square_valid?(1,["X","2","3","4","5","6","7","8","9"]))
		assert_equal(false, game.square_valid?(1,["O","2","3","4","5","6","7","8","9"]))
		assert_equal(false, game.square_valid?(0,["1","2","3","4","5","6","7","8","9"]))
	
	#test_board_full?
		assert_equal(true, game.board_full?(["X","X","X","X","X","X","X","X","X"]))
		assert_equal(false, game.board_full?(["X","X","X","X","X","X","7","X","X"]))
	
	#test_for_win?
		assert_equal(true, game.win?(["X","X","X","4","5","6","7","8","9"]))
		assert_equal(false, game.win?(["1","X","X","X","5","6","7","8","9"]))
	end

end