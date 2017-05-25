require('minitest/autorun')
require('minitest/rg')
require_relative('../dice')
require('pry-byebug')


class TestDice < MiniTest::Test

  def setup()
    @dice = Dice.new()
  end

  # def test_roll_dice()
  #   assert_equal(2, @dice.roll_dice())
  # end


  end