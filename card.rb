class Card
  attr_reader :point
  def initialize(name, point)
    @name = name
    @point = point
  end

  def name
    @name
  end
end