# frozen_string_literal: true

# Class for Cards
class Card
  attr_reader :point, :name

  def initialize(name, point)
    @name = name
    @point = point
  end
end
