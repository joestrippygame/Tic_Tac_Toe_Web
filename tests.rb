require_relative "backend.rb"
require "minitest/autorun"

class Tictactoe_test < Minitest::Test

	def test_initialize
		game = TicTacToe.new()
		game.player1 = "X"
		
		game.board = ["X","X","X","4","5","6","7","8","9"]
		assert_equal(true, game.winner?)
	end
	
	def test_for_O_win
		game = TicTacToe.new()
		game.player1 = "O"
		
		game.board = ["1","2","3","4","5","6","O","O","O"]
		assert_equal(true, game.winner?)
	end
	
	def test_break_the_function
		game = TicTacToe.new()
		game.player1 = "O"
		
		game.board = ["X","X","X","4","5","6","7","8","9"]
		assert_equal(false, game.winner?)
	end
	
	def test_full_not_a_win
		game = TicTacToe.new()
		game.player1 = "X"
		
		game.board = ["X","X","O","X","O","X","O","X","O"]
		assert_equal(false, game.winner?)
	end
	
	def test_go_for_the_win
		game = TicTacToe.new()
		game.player1 = "X"
		
		game.board = ["X","X","3","4","5","6","7","8","9"]
		game.computer_winning_move()
		assert_equal(["X","X","X","4","5","6","7","8","9"], game.board)
	end
	
	def test_for_using_first_availble_win_path
		game = TicTacToe.new()
		game.player1 = "X"
		
		game.board = ["X","X","3","4","5","6","X","8","9"]
		game.computer_winning_move()
		assert_equal(["X","X","X","4","5","6","X","8","9"], game.board)
	end
	
	def test_for_not_overwriting_other_player
		game = TicTacToe.new()
		game.player1 = "X"
		
		game.board = ["X","X","O","4","5","6","X","8","9"]
		game.computer_winning_move()
		assert_equal(["X","X","O","X","5","6","X","8","9"], game.board)
	end
	
	def test_for_computer_winning_move_returns_true
		game = TicTacToe.new()
		game.player1 = "X"
		game.board = ["X","X","O","4","5","6","X","8","9"]
		assert_equal(true, game.computer_winning_move)
	end
	
	def test_for_a_block
		game = TicTacToe.new()
		game.player1 = "X"
		game.player2 = "O"
		game.board = ["O","O","3","4","5","6","O","8","9"]
		game.computer_blocking_move()
		assert_equal(["O","O","X","4","5","6","O","8","9"], game.board)
	end
end