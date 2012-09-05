require 'tic_tac_toe'

tic_tac = TicTacToe.new

puts "Let's play tic-tac-toe"

until tic_tac.game_over? do
  puts tic_tac
  puts "Make your move by typing 0 to 8"

  move = gets.chomp.to_i

  tic_tac.make_move(move)
end

puts "Winner!"
