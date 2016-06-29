GAMES, LOSABLE = gets.chomp.split.map(&:to_i)

GAME_HSH = {'0' => [], '1' => []}
GAMES.times {
  luck, impt = gets.chomp.split.map(&:to_i)
  GAME_HSH[impt.to_s] << luck
}

un_impt_sum = GAME_HSH['0'].reduce(:+).to_i
impt_sum = 0
LOSABLE.times {
  curr_max = GAME_HSH['1'].max
  GAME_HSH['1'].delete_at(GAME_HSH['1'].index(curr_max))
  impt_sum += curr_max
}
impts_won = GAME_HSH['1'].reduce(:+).to_i

puts un_impt_sum + impt_sum - impts_won
