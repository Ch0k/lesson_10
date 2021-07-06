# frozen_string_literal: true

require_relative 'player'
require_relative 'card'
require_relative 'diller'
require_relative 'game'
require_relative 'deck'

# Class Terminala
class Terminal
  def start
    puts 'Введите имя игрока'
    player_name = gets.chomp.to_s
    @game = Game.new(player_name)
    game
  end

  def game
    @game.part1
    puts 'Игрок получает 2 карты'
    puts 'Диллер получает 2 карты'
    player_points(@game.player)
    card_monitor(@game.player)
    puts '1-propustit'
    puts '2-add_card'
    puts '3-open_card'
    number = gets.chomp.to_i
    @game.part2(number)

    if @game.part3? == true
      puts '1-add_card'
      puts '2-open_card'
      number = gets.chomp.to_i
      @game.part3(number)
    end

    player_points(@game.player)
    card_monitor(@game.player)
    diller_points(@game.diller)
    card_monitor_diller(@game.diller)
    @game.winner
    money_monitor_player(@game.player)
    money_monitor_diller(@game.diller)
    if @game.end_game? == true
      puts 'Game over'
    else
      puts 'Сыграем еще?'
      puts '1 - Да'
      puts '2 - Нет'
      z = gets.chomp.to_i
      case z
      when 1
        game
      when 2
        puts 'Game over'
      end
    end
  end

  def player_points(player)
    puts "Сумма очков игрока #{player.points}"
  end

  def diller_points(diller)
    puts "Сумма очков диллера #{diller.points}"
  end

  def card_monitor(player)
    puts 'Карты игрока'
    player.cards.each { |cards| puts cards.name.to_s }
  end

  def card_monitor_diller(diller)
    puts 'Карты диллера'
    diller.cards.each { |cards| puts cards.name.to_s }
  end

  def money_monitor_player(player)
    puts "Банк игрока #{player.money}"
  end

  def money_monitor_diller(diller)
    puts "Банк диллера #{diller.money}"
  end
end
