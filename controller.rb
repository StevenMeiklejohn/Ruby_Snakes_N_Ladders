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

# get '/snakesnladders/:squares/:snakes/:ladders/:name1/:name2' do
#     number_of_squares = params[:squares]
#     no_of_snakes = params[:snakes]
#     no_of_ladders = params[:ladders]
#     name1 = params[:name1]
#     name2 = params[:name2]
#     erb(:confirm)
# end

get '/snakesnladders' do
  @player1 = Player.new(params[:name1])
  @player2 = Player.new(params[:name2])
  @dice = Dice.new()
  @squares = params[:squares]
  @snakes = params[:snakes]
  @ladders = params[:ladders]
  @game = Game.new(@player1, @player2, "setup", @dice)
  @game.populate_board(params[:squares].to_i, params[:snake].to_i, params[:ladders].to_i)

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
  @game.populate_board(params[:squares].to_i, params[:snake].to_i, params[:ladders].to_i)
  erb(:confirm)
end

get '/snakesnladders/game_view' do
  erb(:game_view)
end






# @board = Board.new([])
# @player1 = Player.new(player1_name)
# @player2 = Player.new(player2_name)
# @game = Game.new(@player1, @player2, "setup", @dice)
# @dice = Dice.new()
# @game.populate_board(number_of_squares, number_of_snakes, number_of_ladders)
# @game.set_status("playing")
# game_loop()
