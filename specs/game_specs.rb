require('minitest/autorun')
require('minitest/rg')
require_relative('../board')
require_relative('../square')
require_relative('../player')
require_relative('../dice')
require_relative('../game')


require('pry-byebug')


class TestGame < MiniTest::Test

  def setup()
    @board = Board.new([])
    @player1 = Player.new("Deirdre Barlow")
    @player2 = Player.new("Ken Barlow")
    @game = Game.new(@player1, @player2, "setup", @dice)
    @dice = Dice.new()
    @game.populate_board(20, 3, 3)

  end

  def test_game_can_populate_board()
    assert_equal(20, @game.get_board().count())
  end

  def test_game_has_snakes()
    assert_equal(3, @game.check_number_of_snakes())
  end

  def test_game_has_ladders()
    assert_equal(3, @game.check_number_of_snakes())
  end

  # def test_game_can_take_turn()
  #   @game.take_turn(@player1)
  #   assert_equal(5, @player1.get_position())
  # end

  def test_player_can_win_game()
    @player1.set_position(20)
    assert_equal("win", @game.check_win(@player1))
  end
  


  # def test_game_can_generate_random_snake()
  #   assert_equal(10, @game.generate_random_snake())
  # end



  end