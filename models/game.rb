require_relative ("./square")
require('pry')

class Game

  def initialize(player1, player2, status, dice, board)
    @board = board.get_game_board()
    @player1 = player1
    @player2 = player2
    @status = status
    @dice = dice
    @format = "wrapper5"
  end


  def get_board()
    return @board
  end

  def get_board_size()
    return @board.size()
  end

  def get_board_format()
    return @format
  end

  def set_board_format()
    if get_board_size() < 50
      @format = "wrapper5"
    end
    if get_board_size() > 50
      @format = "wrapper10"
    end
  end

  def get_player1()
    return @player1
  end

  def get_player2()
    return @player2
  end

  def player_square(count, player1, player2)
    if player1.get_position() == count
      return "box_red"
    end
    if player2.get_position() == count
      binding.pry
      return "box_blue"
    end
    return "box"
  end


  def get_status()
    return @status
  end

  def set_status(new_state)
    @status = new_state
  end

  # def populate_board(number_of_squares, number_of_snakes, number_of_ladders)
  #   counter = 1
  #   while counter <= number_of_squares
  #     @board << Square.new(counter, 0)
  #     counter += 1
  #   end
  #   set_snakes(number_of_snakes, number_of_ladders)
  # end

  # def get_square(position)
  #   return @board[position]
  # end


  # def set_snakes(number_of_snakes, number_of_ladders)
  #   counter = 1
  #   snake = generate_random_snake()
  #   while counter <= number_of_snakes
  #     square = @board.sample()
  #     if(square.get_effect() == 0 && square.get_number() > (@board.count() - 1) + -snake)
  #       square.set_effect(-snake)
  #       counter += 1
  #     end
  #   end
  #   set_ladders(number_of_ladders)
  # end

  # def set_ladders(number_of_ladders)
  #   counter = 1
  #   ladder = generate_random_ladder()
  #   while counter <= number_of_ladders
  #     square = @board.sample()
  #     if(square.get_effect() == 0 && square.get_number() < @board.count() + ladder)
  #       square.set_effect(ladder)
  #       counter += 1
  #     end
  #   end

  # end


  # def generate_random_snake()
  #   range = (1..@board.count())
  #   random_number = rand(range)
  #   # random_snake = -(random_number)
  #   return random_number
  # end

  # def generate_random_ladder()
  #   range = (1..@board.count())
  #   random_number = rand(range)
  #   return random_number
  # end

  # def check_number_of_snakes()
  #   counter = 0
  #   for square in @board
  #     if(square.get_effect() < 0)
  #       counter += 1
  #     end
  #   end
  #   return counter
  # end

  # def check_number_of_ladders()
  #   counter = 0
  #   for square in @board
  #     if(square.get_effect() > 0)
  #       counter += 1
  #     end
  #   end
  #   return counter
  # end

  def roll_dice()
    return rand(1..6)
  end

  def take_turn(player)
    roll = roll_dice()
    player.move(roll)
    if(check_win(player) == "win")
      puts "Congratulations #{player.get_name()}! You win"
      return
    end
    puts "#{player.get_name()} rolled a #{roll}!"
    check_snake_ladder(player)
  end

  def check_snake_ladder(player)
    position = player.get_position()
    
    if(get_square(position).get_effect() < 0)
      player.move(@board[player.get_position].get_effect())
      puts "#{player.get_name()} landed on a snake and slides to #{player.get_position()}"
    end

    if(get_square(position).get_effect() > 0)
      player.move(@board[player.get_position].get_effect())
      puts "#{player.get_name()} landed on a ladder and climbs to #{player.get_position()}"
      if(check_win(player) == "win")
        puts "Congratulations #{player.get_name()}! You win"
        return
      end
      else
        puts "#{player.get_name()} moves to #{player.get_position()}"
    end
  end


  def check_win(player)
    if(player.get_position >= @board.count)
      @status = "win"
    end
  end









end
