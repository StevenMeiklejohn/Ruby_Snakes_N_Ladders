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
  @game = Game.new(@player1, @player2, "setup", @dice)
  erb(:confirm)
end

post '/snakesnladders' do
  @player1 = Player.new(params[:name1])
  @player2 = Player.new(params[:name2])
  @dice = Dice.new()
  @squares = params[:squares]
  @snakes = params[:snakes]
  @ladders = params[:ladders]
  @game = Game.new(@player1, @player2, "setup", @dice)
  # @game.populate_board(params[:squares].to_i, params[:snake].to_i, params[:ladders].to_i)
  GlobalState = {:player1 => @player1, :player2 => @player2, :dice => @dice, :squares => @squares, :snakes => @snakes, :ladders => @ladders}
  erb(:confirm)
end

get '/snakesnladders/game_view' do
  @player1 = GlobalState[:player1]
  @player2 = GlobalState[:player2]
  @dice = GlobalState[:dice]
  @squares = GlobalState[:squares]
  @snakes = GlobalState[:snakes]
  @ladders = GlobalState[:ladders]
  @game = Game.new(@player1, @player2, "setup", @dice)
  @game.populate_board(@squares.to_i, @snakes.to_i, @ladders.to_i)
  @game.set_board_format()
  erb(:game_view)
end

