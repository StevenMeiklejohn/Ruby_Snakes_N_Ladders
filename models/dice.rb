
class Dice

  

  def initialize()
    @current_number = 0
  end

  def roll_dice()
    @current_number = rand(1..6)
    return @current_number
  end

  def get_number()
    return @current_number
  end

end
