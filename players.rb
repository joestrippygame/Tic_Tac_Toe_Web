class Players
	attr_accessor :player1, :player2, :current, :type
	
	def initialize
		@player1 = ""
		@player2 = ""
		@current = 1
		@type = ""
	end
	
	def p2
		player1 == "X" ? "O" : "X"
	end
	
	def current_player
		current == 1 ? player1 : player2
	end
	
	def opposite_player
		current == 1 ? player2 : player1
	end
	
	def change
		current == 1 ? current = 2 : current = 1
	end
end