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
  @board.populate_board
  @game = Game.new(@player1, @player2, "setup", @dice, @board)
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
  # @player1.set_position(10)
  # @player2.set_position(4)

  erb(:game_view)
end

