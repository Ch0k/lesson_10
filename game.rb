# frozen_string_literal: true

# Class for BlackJack
class Game
  attr_accessor :player, :diller

  def initialize(player_name)
    @player = Player.new(player_name)
    @diller = Diller.new
    @deck = Deck.new
    @deck.generate
    @part3 = false
    @winner = []
  end

  def part1
    empty_cards
    send_player_money_to_bank
    send_diller_money_to_bank
    send_cards
    send_cards_to_diller
  end

  def send_cards
    @player.receive_cards(@deck.cards.sample)
    @player.receive_cards(@deck.cards.sample)
  end

  def add_card
    @player.receive_cards(@deck.cards.sample)
  end

  def send_cards_to_diller
    @diller.receive_cards(@deck.cards.sample)
    @diller.receive_cards(@deck.cards.sample)
  end

  def send_player_money_to_bank
    @player.send_money
  end

  def send_diller_money_to_bank
    @diller.send_money
  end

  def add_card_to_diller
    @diller.receive_cards(@deck.cards.sample)
  end

  def part2(number)
    case number
    when 1
      add_card_to_diller if @diller.points < 17
      @part3 = true
    when 2
      add_card
      add_card_to_diller if @diller.points < 17
      who_win
    when 3
      who_win
    end
  end

  def part3?
    @part3
  end

  def part3(number)
    case number
    when 1
      add_card
      who_win
    when 2
      who_win
    end
  end

  def who_win
    if (@player.points > @diller.points) && (@player.points <= 21)
      puts 'Player win'
      @player.add_money(20)
      @winner << @player
    elsif (@player.points > @diller.points) && (@player.points > 21)
      puts 'Diller win'
      @diller.add_money(20)
      @winner << @diller
    elsif (@player.points < @diller.points) && (@player.points < 21)
      puts 'Diller win'
      @diller.add_money(20)
      @winner << @diller
    else
      (@player.points == @diller.points)
      puts 'ravno'
      @diller.add_money(10)
      @player.add_money(10)
    end
  end

  attr_reader :winner

  def end_game?
    true if @diller.money.zero? || @diller.money.negative? || @player.money.zero? || @player.money.negative?
  end

  def empty_cards
    @player.empty_cards
    @diller.empty_cards
    @player.points = 0
    @diller.points = 0
    @winner = []
  end
end
