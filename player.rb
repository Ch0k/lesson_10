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
    if card.name !~ /[T]/ 
      @points += card.point
    else 
      if (21 - @points) > 10  
        @points += 11
      else 
        @points += 1
      end
    end
  end

  def cards
    @cards
  end

  def send_money
    @money -= 10
  end

  def add_money(x)
    @money += x
  end
  
  def empty_cards
    @cards = []
  end

end