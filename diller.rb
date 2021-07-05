# frozen_string_literal: true

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

  attr_reader :cards

  def add_money(number)
    @money += number
  end

  def empty_cards
    @cards = []
  end
end
