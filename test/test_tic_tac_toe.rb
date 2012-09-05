require 'test/unit'
require 'tic_tac_toe'
require 'pp'

class TestTicTacToe < Test::Unit::TestCase
  def test_there_is_a_board
    tic_tac = TicTacToe.new
    assert_not_nil tic_tac
    assert_not_nil tic_tac.board
  end

  def test_can_tell_when_game_over_because_someone_won
    tic_tac = TicTacToe.new

    tic_tac.board = ["X", "X", "X", nil, nil, nil, nil, nil, nil]
    assert tic_tac.game_over?

    tic_tac.board = [nil, nil, nil, "X", "X", "X", nil, nil, nil]
    assert tic_tac.game_over?

    tic_tac.board = [nil, nil, nil, nil, nil, nil, "X", "X", "X"]
    assert tic_tac.game_over?

    tic_tac.board = ["X", nil, nil, "X", nil, nil, "X", nil, nil]
    assert tic_tac.game_over?

    tic_tac.board = [nil, "X", nil, nil, "X", nil, nil, "X", nil]
    assert tic_tac.game_over?

    tic_tac.board = [nil, nil, "X", nil, nil, "X", nil, nil, "X"]
    assert tic_tac.game_over?

    tic_tac.board = ["X", nil, nil, nil, "X", nil, nil, nil, "X"]
    assert tic_tac.game_over?

    tic_tac.board = [nil, nil, "X", nil, "X", nil, "X", nil, nil]
    assert tic_tac.game_over?
  end

  def test_can_make_a_move
    tic_tac = TicTacToe.new

    tic_tac.make_move(8)

    expected_board = [nil, nil, nil, nil, nil, nil, nil, nil, "X"]
    assert_equal expected_board, tic_tac.board
  end

  def test_moves_alternate_between_x_and_o
    tic_tac = TicTacToe.new

    tic_tac.make_move(8)

    expected_board = [nil, nil, nil, nil, nil, nil, nil, nil, "X"]
    assert_equal expected_board, tic_tac.board

    tic_tac.make_move(7)
    expected_board = [nil, nil, nil, nil, nil, nil, nil, "O", "X"]
    assert_equal expected_board, tic_tac.board
  end

  def test_cant_overwrite_an_existing_x_or_o
    tic_tac = TicTacToe.new

    tic_tac.make_move(8)

    expected_board = [nil, nil, nil, nil, nil, nil, nil, nil, "X"]
    assert_equal expected_board, tic_tac.board

    assert_raise RuntimeError do
      tic_tac.make_move(8)
    end

    expected_board = [nil, nil, nil, nil, nil, nil, nil, nil, "X"]
    assert_equal expected_board, tic_tac.board
  end

  def test_x_wins
    tic_tac = TicTacToe.new
    tic_tac.make_move(0) # X
    tic_tac.make_move(4) # O
    tic_tac.make_move(1) # X
    tic_tac.make_move(5) # O
    tic_tac.make_move(2) # X

    assert tic_tac.game_over?
  end

  def test_o_wins
    tic_tac = TicTacToe.new
    tic_tac.make_move(0) # X
    tic_tac.make_move(3) # O
    tic_tac.make_move(1) # X
    tic_tac.make_move(4) # O
    tic_tac.make_move(2) # X
    tic_tac.make_move(5) # O

    assert tic_tac.game_over?
  end

  def test_cant_play_off_board
    tic_tac = TicTacToe.new

    assert_raise RuntimeError do
      tic_tac.make_move(13)
    end
  end

  def test_to_s
    tic_tac = TicTacToe.new

    empty_board = "___|___|___\n___|___|___\n   |   |   "

    assert_equal empty_board, tic_tac.to_s

    tic_tac.make_move(0) # X

    one_x_board = "_X_|___|___\n___|___|___\n   |   |   "
    assert_equal one_x_board, tic_tac.to_s

    (1..8).each do |x|
      tic_tac.make_move(x)
    end

    full_board = "_X_|_O_|_X_\n_O_|_X_|_O_\n X | O | X "
    assert_equal full_board, tic_tac.to_s
  end
end
