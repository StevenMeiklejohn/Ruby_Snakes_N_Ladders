
class Player

def initialize(name)
  @name = name
  @position = 0
end

def get_name()
  return @name
end

def set_name(new_name)
  @name = new_name
end

def get_position()
  return @position
end

def set_position(new_position)
  @position = new_position
end

def move(amount)
  @position += amount
end



end
