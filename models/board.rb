class Board

  def initialize(squares)
    @squares = squares
  end


  def get_square(number)
    return @squares[number]
  end

  def get_number_of_squares()
    @squares.size()
  end




  

  

end