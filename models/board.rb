class Board

  def initialize(squares, number_of_snakes, number_of_ladders )
    @squares = squares.to_i
    @number_of_snakes = number_of_snakes.to_i
    @number_of_ladders = number_of_ladders.to_i
    @format = 5
    @game_board = []
  end


  def get_square(number)
    return @squares[number]
  end


  def get_format()
    return @format
  end

  # def set_format()
  #   if @squares < 50
  #     @format = "wrapper5"
  #   end
  #   if @squares > 50
  #     @format = "wrapper10"
  #   end
  # end

  def get_game_board()
    return @game_board
  end


  def populate_board()
    counter = 1
    while counter <= @squares
      @game_board << Square.new(counter, 0)
      counter += 1
    end
    set_snakes()
  end

  def get_square(position)
    return @board[position]
  end


  def set_snakes()
    counter = 1
    snake = generate_random_snake()
    while counter <= @number_of_snakes
      square = @game_board.sample()
      if(square.get_effect() == 0 && square.get_number() > (@game_board.count() - 1) + -snake)
        square.set_effect(-snake)
        counter += 1
      end
    end
    set_ladders()
  end

  def set_ladders()
    counter = 1
    ladder = generate_random_ladder()
    while counter <= @number_of_ladders
      square = @game_board.sample()
      if(square.get_effect() == 0 && square.get_number() < @game_board.count() + ladder)
        square.set_effect(ladder)
        counter += 1
      end
    end

  end


  def generate_random_snake()
    range = (1..@game_board.count())
    random_number = rand(range)
    # random_snake = -(random_number)
    return random_number
  end

  def generate_random_ladder()
    range = (1..@game_board.count())
    random_number = rand(range)
    return random_number
  end

  def check_number_of_snakes()
    counter = 0
    for square in @game_board
      if(square.get_effect() < 0)
        counter += 1
      end
    end
    return counter
  end

  def check_number_of_ladders()
    counter = 0
    for square in @game_board
      if(square.get_effect() > 0)
        counter += 1
      end
    end
    return counter
  end



  def get_number_of_squares()
    @squares.size()
  end




  

  

end