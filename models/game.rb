require_relative ("./square")
require_relative ("./board")
require('pry')

class Game

  def initialize(player1, player2, status, dice, board)
    @board = board.get_game_board()
    @player1 = player1
    @player2 = player2
    @status = status
    @dice = dice
    @format = "wrapper5"

    @player1.set_position(3)
    @player2.set_position(2)
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
      return "box_green"
    end
    if player2.get_position() == count
      # binding.pry
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

  def roll_dice()
    return rand(1..6)
  end

  def get_dice_number()
    return @dice.get_number()
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
    # binding.pry
    if(@board[position].get_effect().to_i < 0)
      player.move(@board[position].get_effect())
      puts "#{player.get_name()} landed on a snake and slides to #{player.get_position()}"
    end

    if(@board[position].get_effect() > 0)
      player.move(@board[position].get_effect().to_i)
      # puts "#{player.get_name()} landed on a ladder and climbs to #{player.get_position()}"
      if(check_win(player) == "win")
        # puts "Congratulations #{player.get_name()}! You win"
        return
      end
      else
        return
    end
  end


  def check_win(player)
    if(player.get_position >= @board.count)
      @status = "win"
    end
  end









end
