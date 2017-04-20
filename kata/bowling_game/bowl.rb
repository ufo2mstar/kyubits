
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
		play = 0
		total = 0
		while frame < 10
			total += @rolls[play] + @rolls[play+1]
			frame+=1
			play +=1
		end
		total
	end
end