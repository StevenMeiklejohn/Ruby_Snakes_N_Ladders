require_relative("./test")
require_relative('./board')
require_relative('./square')
require_relative('./player')
require_relative('./dice')
require_relative('./game')


Shoes.app{
  # background "snakes.png"
  background "#99ff99"

  # stack(margin:8)
  stack {
    test = Test.new(self)
    test.setup()
  }

  # test = Test.new(self)
  # test.setup()
  # test.create_box()
}