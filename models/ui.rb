require_relative('./board')
require_relative('./square')
require_relative('./player')
require_relative('./dice')
require_relative('./game')

# def game_loop()
#   while (@game.get_status == "playing")
#     @game.take_turn(@player1)
#     if(@game.check_win(@player1) == "win")
#       return
#     end
#     @game.take_turn(@player2)
#     @game.check_win(@player2)
#   end
# end



# puts "Let's play Snakes n' Ladders!"
# puts "Press enter to continue."
# gets
# puts "Please enter the number of squares you would like on your board."
# number_of_squares = gets.chomp.to_i()
# puts "Please enter the number of snakes you would like in your game."
# number_of_snakes = gets.chomp.to_i()
# puts "Please enter the number of ladders you would like in your game."
# number_of_ladders = gets.chomp.to_i()
# puts "Please enter player 1 name"
# player1_name = gets.chomp
# puts "Please enter player 2 name"
# player2_name = gets.chomp


# @board = Board.new([])
# @player1 = Player.new(player1_name)
# @player2 = Player.new(player2_name)
# @game = Game.new(@player1, @player2, "setup", @dice)
# @dice = Dice.new()
# @game.populate_board(number_of_squares, number_of_snakes, number_of_ladders)
# @game.set_status("playing")
# game_loop()










