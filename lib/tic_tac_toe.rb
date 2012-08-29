class TicTacToe
  attr_accessor :board

  SIZE = 3

  def initialize
    @board = Array.new(SIZE**2)
    @current_player = "X"
  end

  def make_move(location)
    if @board[location] then
      raise "Already Taken"
    else
      @board[location] = @current_player
    end

    if @current_player == "X"
      @current_player = "O"
    else
      @current_player = "X"
    end
  end

  def game_over?
    slices = board.each_slice(SIZE).map { |x| x }
    transposed_slices = slices.transpose

    board.each_slice(SIZE) do |row|
      return true if row.all? { |c| c == "X" }
    end

    transposed_slices.each do |row|
      return true if row.all? { |c| c == "X" }
    end

    diag1 = board.each_slice(SIZE + 1).map { |x| x[0] }
    return true if diag1.all? { |c| c == "X" }

    diag2 = board.each_slice(SIZE - 1).map { |x| x[0] }[1..-2]
    return true if diag2.all? { |c| c == "X" }

    false
  end
end

