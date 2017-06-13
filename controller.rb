require( 'pry-byebug' )
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/board' )
require_relative( './models/dice' )
require_relative( './models/game' )
require_relative( './models/graphics' )
require_relative( './models/player' )
require_relative( './models/square' )
require_relative( './models/ui' )

#homepage
get '/snakesnladders/new' do
  erb( :new )
end

get '/snakesnladders' do
  @player1 = GlobalState[:player1]
  @player2 = GlobalState[:player2]
  @dice = GlobalState[:dice]
  @squares = GlobalState[:squares]
  @snakes = GlobalState[:snakes]
  @ladders = GlobalState[:ladders]
  @board = Board.new(@squares, @snakes, @ladders)
  # @board.populate_board()
  # @game = Game.new(@player1, @player2, "setup", @dice, @board)
  erb(:confirm)
end

post '/snakesnladders' do
  @player1 = Player.new(params[:name1])
  @player2 = Player.new(params[:name2])
  @dice = Dice.new()
  @squares = params[:squares]
  @snakes = params[:snakes]
  @ladders = params[:ladders]
  @board = Board.new(@squares, @snakes, @ladders)
  @game = Game.new(@player1, @player2, "setup", @dice, @board)
  @board.populate_board
  GlobalState = {:player1 => @player1, :player2 => @player2, :dice => @dice, :squares => @squares, :snakes => @snakes, :ladders => @ladders, :board => @board, :game => @game}
  erb(:confirm)
end

get '/snakesnladders/game_view' do
  @player1 = GlobalState[:player1]
  @player2 = GlobalState[:player2]
  @dice = GlobalState[:dice]
  @squares = GlobalState[:squares]
  @snakes = GlobalState[:snakes]
  @ladders = GlobalState[:ladders]
  @board = GlobalState[:board]
  @game = GlobalState[:game]
  # binding.pry
  # @board.populate_board()
  # @game = Game.new(@player1, @player2, "setup", @dice, @board)
  
  @game.set_board_format()
  @player1.set_position(0)
  @player2.set_position(0)

  erb(:game_view)
end

get '/snakesnladders/game_view/inplay' do
  @player1 = GlobalState[:player1]
  @player2 = GlobalState[:player2]
  @dice = GlobalState[:dice]
  @squares = GlobalState[:squares]
  @snakes = GlobalState[:snakes]
  @ladders = GlobalState[:ladders]
  @board = GlobalState[:board]
  @game = GlobalState[:game]
  # binding.pry
  # @board.populate_board()
  # @game = Game.new(@player1, @player2, "setup", @dice, @board)
  
  @game.set_board_format()
  erb(:inplay)
end



post '/snakesnladders/roll_dice' do
  # @dice = GlobalState[:dice]
  # @rolled = @dice.roll_dice()
  @game = GlobalState[:game]
  @player1 = GlobalState[:player1]
  @player2 = GlobalState[:player2]
  @game.take_turn(@player1)
  redirect '/snakesnladders/game_view/inplay'
end

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





