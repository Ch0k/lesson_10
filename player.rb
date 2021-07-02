class Player

  attr_reader :points, :money
  @@all = []
  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @money = 100
    @@all << self
  end

  def receive_cards(card)
    @cards << card
    @points += card.point
  end

  def self.all
    @@all[0]
  end

  def cards
    @cards
  end

  def send_money
    @money -= 10
  end

  def say_stop
    @cards.each{ |cart| @points += cart.point  }
  end

end