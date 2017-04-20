
class Game
	def initialize
		@rolls = Array.new 21
		@roll_count = 0
	end

	def roll pins
		@rolls[@roll_count] = pins
		@roll_count+=1
	end

	def score
		frame = 0
		while frame < 10
			@rolls[0]
			frame+=1
		end

	end
end