class Player
  def initialize(name)
    @name = name
    @cards = []
    @points = 0
  end

  def receive_cards(card)
    @cards << card
  end

  def say_stop
    @points = @cards.each{ |cart.point|  }
  end

end