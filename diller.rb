# Class Dillers 
class Diller

  def def initialize
    @cards = []
    @points = 0
    @money = 100
  end

  def receive_cards(card)
    @cards << card
    @points += card.point
  end

  def distribution
  end

  def receive_cards(card)
    @cards << card
  end

  def send_money
    @money -= 10
  end

end