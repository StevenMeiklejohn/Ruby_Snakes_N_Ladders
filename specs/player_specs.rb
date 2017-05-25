require('minitest/autorun')
require('minitest/rg')
require_relative('../board')
require_relative('../square')
require_relative('../player')
require_relative('../dice')
require_relative('../game')


require('pry-byebug')


class TestPlayer < MiniTest::Test

def setup()
  @player = Player.new("Steve")
end

def test_player_has_postion()
  assert_equal(0, @player.get_position())
end

def test_player_can_move__positive()
  @player.move(5)
  assert_equal(5, @player.get_position())
end

def test_player_can_move__negative()
  @player.move(10)
  @player.move(-5)
  assert_equal(5, @player.get_position())
end

end
