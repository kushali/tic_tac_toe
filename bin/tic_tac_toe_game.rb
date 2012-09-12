require '../lib/tic_tac_toe'
require '../lib/random_opponent'

tic_tac = TicTacToe.new

puts "Let's play tic-tac-toe"

opponent = RandomOpponent.new

until tic_tac.game_over? do
  puts tic_tac
  puts "Make your move by typing 0 to #{TicTacToe::SIZE**2}"

  move = gets.chomp.to_i

  tic_tac.make_move(move)

  move = opponent.make_move(tic_tac.board)

  tic_tac.make_move(move)
  tic_tac.to_s
end

puts "Winner!"
