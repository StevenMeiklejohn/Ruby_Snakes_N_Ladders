class Board

  def initialize(squares)
    @squares = squares
    @format = 5
  end


  def get_square(number)
    return @squares[number]
  end

  def get_format()
    return @format
  end

  def set_format()
    if @squares < 50
      @format = "wrapper5"
    end
    if @squares > 50
      @format = "wrapper10"
    end
  end



  def get_number_of_squares()
    @squares.size()
  end




  

  

end