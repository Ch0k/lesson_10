# frozen_string_literal: true

require_relative 'player'
require_relative 'card'
require_relative 'diller'

# Class for BlackJack

# rubocop:disable Metrics/ClassLength
class BlackJack
  def menu
    puts 'Введите имя игрока'
    x = gets.chomp.to_s
    create_player(x)
    create_diller
    game
  end

  def game
    puts 'Игрок получает 2 карты'
    send_cards
    puts 'Диллер получает 2 карты'
    send_cards_to_diller
    player_points
    send_player_money_to_bank
    send_diller_money_to_bank
    player_points
    card_monitor
    hod_igroka
  end

  def create_player(_name)
    @player1 = Player.new('name')
  end

  def create_diller
    @diller1 = Diller.new
  end

  def send_cards
    @player1.receive_cards(@cards.sample)
    @player1.receive_cards(@cards.sample)
  end

  def add_card
    @player1.receive_cards(@cards.sample)
  end

  def send_cards_to_diller
    @diller1.receive_cards(@cards.sample)
    @diller1.receive_cards(@cards.sample)
  end

  def player_points
    puts "Сумма очков игрока #{@player1.points}"
  end

  def diller_points
    puts "Сумма очков диллера #{@diller1.points}"
  end

  def card_monitor
    puts 'Карты игрока'
    @player1.cards.each { |cards| puts cards.name.to_s }
  end

  def card_monitor_diller
    puts 'Карты диллера'
    @diller1.cards.each { |cards| puts cards.name.to_s }
  end

  def money_monitor_player
    puts "Банк игрока #{@player1.money}"
  end

  def money_monitor_diller
    puts "Банк диллера #{@diller1.money}"
  end

  def send_player_money_to_bank
    @player1.send_money
  end

  def send_diller_money_to_bank
    @diller1.send_money
  end

  def add_card_to_diller
    @diller1.receive_cards(@cards.sample)
  end

  def hod_igroka
    puts '1-propustit'
    puts '2-add_card'
    puts '3-open_card'
    y = gets.chomp.to_i
    case y
    when 1
      add_card_to_diller if @diller1.points < 17
      hod_igroka2
    when 2
      add_card
      player_points
      card_monitor
      add_card_to_diller if @diller1.points < 17
      open_card
    when 3
      open_card
    end
  end

  def hod_igroka2
    puts '1-add_card'
    puts '2-open_card'
    y = gets.chomp.to_i
    case y
    when 1
      add_card
      open_card
    when 2
      open_card
    end
  end

  def win
    if (@player1.points > @diller1.points) && (@player1.points <= 21)
      puts 'Player win'
      @player1.add_money(20)
      @player1.points = 0
    elsif (@player1.points > @diller1.points) && (@player1.points > 21)
      puts 'Diller win'
      @diller1.add_money(20)
    elsif (@player1.points < @diller1.points) && (@player1.points < 21)
      puts 'Diller win'
      @diller1.add_money(20)
    else
      (@player1.points == @diller1.points)
      puts 'ravno'
      @diller1.add_money(10)
      @player1.add_money(10)
    end
  end

  def end_game
    if @diller1.money.zero? || @player1.money.zero?
      puts 'Game over'
    else
      puts 'Сыграем еще?'
      puts '1 - Да'
      puts '2 - Нет'
      y = gets.chomp.to_i
      case y
      when 1
        game
      when 2
        puts 'Bye'
      end
    end
  end

  def empty_cards
    @player1.empty_cards
    @diller1.empty_cards
    @player1.points = 0
    @diller1.points = 0
  end

  def open_card
    player_points
    card_monitor
    diller_points
    card_monitor_diller
    win
    money_monitor_player
    money_monitor_diller
    empty_cards
    end_game
  end

  def seed
    @znacheniya = [{ 'T': 11 },
                   { 'K': 10 },
                   { 'D': 10 },
                   { 'V': 10 },
                   { '10': 10 },
                   { '9': 9 },
                   { '8': 8 },
                   { '7': 7 },
                   { '6': 6 },
                   { '5': 5 },
                   { '4': 4 },
                   { '3': 3 },
                   { '2': 2 }]
    @masti = %w[<3 <> ^ +]
    @coloda = @znacheniya.product(@masti)
    @cards = []
    @coloda.each do |x, y|
      x.each do |key, value|
        @key = key
        @value = value
      end
      ddd = @key.to_s + y.to_s
      @cards << Card.new(ddd, @value)
    end
  end
end
# rubocop:enable Metrics/ClassLength
