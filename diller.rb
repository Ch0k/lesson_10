# Class Dillers 
class Diller
  attr_accessor :points, :money
  def initialize
    @cards = []
    @points = 0
    @money = 100
  end

  def receive_cards(card)
    @cards << card
    @points += card.point
  end

  def send_money
    @money -= 10
  end

  def cards
    @cards
  end

  def add_money(x)
    @money += x
  end
  
  def empty_cards
    @cards = []
  end

end