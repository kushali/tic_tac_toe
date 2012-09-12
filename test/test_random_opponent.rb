require 'test/unit'
require 'random_opponent'

class TestRandomOpponent < Test::Unit::TestCase
  def test_existance
    opponent = RandomOpponent.new
    assert opponent
  end

  def test_make_move
    opponent = RandomOpponent.new

    board = Array.new(9)
    move = opponent.make_move(board)

    assert move.between?(0, 8)

    almost_full_board = Array.new(9).fill("X")
    almost_full_board[0] = nil

    move = opponent.make_move(almost_full_board)
    assert_equal 0, move
  end
end
