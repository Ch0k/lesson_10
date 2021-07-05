class Player

  attr_accessor :points, :money
  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @money = 100
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

  def add_money
    @money += 20
  end
  
end