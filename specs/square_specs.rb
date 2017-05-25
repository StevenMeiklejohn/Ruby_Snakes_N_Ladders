require('minitest/autorun')
require('minitest/rg')
require_relative('../square')
require('pry-byebug')


class TestSquare < MiniTest::Test

  def setup()
    @square = Square.new(10, 5)
  end

  def test_square_has_number()
    assert_equal(10, @square.get_number())
  end

  def test_square_has_effect()
    assert_equal(5, @square.get_effect())
  end

  def test_can_set_effect()
    @square.set_effect(-5)
    assert_equal(-5, @square.get_effect())
  end




end
