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
	
	def test_for_a_fork
		game = TicTacToe.new()
		game.player1 = "O"
		game.board = ["O","2","O","4","5","6","7","8","9"]
		game.computer_fork_move()
		assert_equal(["O","2","O","4","5","6","O","8","9"], game.board)
	end
	
	def test_for_a_fork2
		game = TicTacToe.new()
		game.player1 = "O"
		game.board = ["O","2","3","4","5","6","O","8","9"]
		game.computer_fork_move()
		assert_equal(["O","2","O","4","5","6","O","8","9"], game.board)
	end
	
	def test_for_a_fork3
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["O","2","3","4","X","O","X","8","9"]
		game.computer_fork_move()
		assert_equal(["O","2","O","4","X","O","X","8","9"], game.board)
	end
	
	def test_for_a_fork_block
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","3","4","O","X","7","8","9"]
		game.computer_fork_block()
		assert_equal(["X","2","O","4","O","X","7","8","9"], game.board)
	end
	
	def test_for_a_fork_block2
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","3","O","5","6","X","8","9"]
		game.computer_fork_block()
		assert_equal(["X","2","O","O","5","6","X","8","9"], game.board)
	end
	
	def test_for_picking_the_center_square
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","3","4","5","6","7","8","9"]
		game.computer_move_center()
		assert_equal(["X","2","3","4","O","6","7","8","9"], game.board)
	end
	
	def test_for_picking_the_center_square
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","3","4","X","6","7","8","9"]
		game.computer_move_center()
		assert_equal(["X","2","3","4","X","6","7","8","9"], game.board)
	end
	
	def test_for_picking_the_opposite_corner
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","3","4","5","6","7","8","9"]
		game.computer_move_opposite_corner()
		assert_equal(["X","2","3","4","5","6","7","8","O"], game.board)
	end
	
	def test_for_picking_the_opposite_corner2
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["1","2","X","4","5","6","7","8","9"]
		game.computer_move_opposite_corner()
		assert_equal(["1","2","X","4","5","6","O","8","9"], game.board)
	end
	
	def test_for_picking_an_empty_corner
		game = TicTacToe.new()
		game.player1 = "O"
		game.player2 = "X"
		game.board = ["X","2","X","4","5","6","X","8","9"]
		game.computer_move_empty_corner()
		assert_equal(["X","2","X","4","5","6","X","8","O"], game.board)
	end
end