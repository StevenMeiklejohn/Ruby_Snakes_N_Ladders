
class Test

  def initialize(app)
    @app = app
  end

  def setup()
      @app.title( "Welcome to Snakes and Ladders!",
        align: "center",
        font:   "Trebuchet MS",
        font:   "Trebuchet MS"
        ) >> Shoes::Title
        
      # @app.image "snakes.png"
      # @app.subtitle "Please click button to continue"
      # #   align:  "center",
      # #   font:   "Trebuchet MS",
      # #   font:   "Trebuchet MS",
      # #   )
      # @app.button "Continue"
      # #   align: "center"
      # #   )
  end

  #   stack {
  #     button "Push this button"
  #     button "No! Push this button"
  #     button "Balls to that. Push this button!"
  #      }

  def display()
    @app.para "Hello World"
  end

  def create_box()
    @app.edit_box(
      "1",
    top: 200,
    left: 200,
    width: 100,
    height: 100
    )
  end

  def image()
    @app.para "Ahoy!"
    @app.image "https://static.omelete.uol.com.br/legacy/images/galerias/Batman-em-20-momentos/Batman-por-Marshall-Rogers.jpg"
  end



end



# Shoes.app do
#  @e = edit_box “Would that I...”,
#  :width => 400, :height => 240
# end

