require_relative "backend.rb"
require "minitest/autorun"

class Tictactoe_test < Minitest::Test

	def test_for_marker_valid
		assert_equal(true, marker_valid?("O"))
		assert_equal(true, marker_valid?("X"))
		assert_equal(false, marker_valid?("Q"))
	end
	
	def test_for_set_player_2
		assert_equal("X", p2("O"))
		assert_equal("O", p2("X"))
	end
	
	def test_for_square_valid
		assert_equal(true, square_valid?(1,["1","2","3","4","5","6","7","8","9"]))
		assert_equal(false, square_valid?(1,["X","2","3","4","5","6","7","8","9"]))
		assert_equal(false, square_valid?(1,["O","2","3","4","5","6","7","8","9"]))
		assert_equal(false, square_valid?(0,["1","2","3","4","5","6","7","8","9"]))
	end
	
	def test_board_full?
		assert_equal(true, board_full?(["X","X","X","X","X","X","X","X","X"]))
		assert_equal(false, board_full?(["X","X","X","X","X","X","7","X","X"]))
	end
	
	def test_for_win?
		assert_equal(true, win?(["X","X","X","4","5","6","7","8","9"]))
		assert_equal(false, win?(["1","X","X","X","5","6","7","8","9"]))
	end

end