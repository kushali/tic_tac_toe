class TicTacToe
  attr_accessor :board

  SIZE = 3

  def initialize
    @board = Array.new(SIZE**2)
    @current_player = "X"
  end

  def make_move(location)
    raise "Bad location" if location >= SIZE ** 2

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

  Xs = ["X"] * SIZE
  Os = ["O"] * SIZE

  def same? arrays
    arrays.any? { |array| array == Xs or array == Os }
  end

  def game_over?
    same? rows or
      same? cols or
      same? diagonals
  end

  def rows
    board.each_slice(SIZE).to_a
  end

  def cols
    rows.transpose
  end

  def diagonals
    diagonal1 = board.each_slice(SIZE + 1).map { |x| x[0] }
    diagonal2 = board.each_slice(SIZE - 1).map { |x| x[0] }[1..-2]
    [diagonal1, diagonal2]
  end

  def cell_to_s value
    spacer = "_"
    # if last
    #   spacer = " "
    # else
    #   spacer = "_"
    # end

    if value
      "#{spacer}#{value}#{spacer}"
    else
      spacer * 3
    end
  end

  def to_s
    rows = board.map { |cell| cell_to_s cell }.
      each_slice(SIZE).map { |r| r.join("|") }
    rows[-1].gsub!("_", " ")
    rows.join("\n")
  end
end
