class RandomOpponent
  def make_move(board)
    begin
      move = rand(board.length)
    end while board[move]
    move
  end
end
