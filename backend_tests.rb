require_relative "web.rb"
require "minitest/autorun"

class Tictactoe_test < Minitest::Test

	def test_for_players
		assert_equal("X", players("O"))
		assert_equal("O", players("X"))
	end
	
	def test_for_current_player
		assert_equal("X", current(1))
	end
	
	def test_board_full?
		assert_equal(true, board_full?(["X","X","X","X","X","X","X","X","X"]))
		assert_equal(false, board_full?(["X","X","X","X","X","X","7","X","X"]))
	end
	
	def test_for_win?
		assert_equal(true, win(["X","X","X","4","5","6","7","8","9"]))
		assert_equal(false, win(["1","X","X","X","5","6","7","8","9"]))
	end

end