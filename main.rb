class BlackJack

  def menu
    puts 'Введите имя игрока'
    x = get.chomp.to_s
    create_player(x)
    # Игрок получает 2 карты
    recive_card_to_player
    # Диллер получает 2 карты
    recive_card_to_diller
    # Выводим количество очков игрока
    puts player_points
    # Отправляем деньги пользователя в банк

    send_player_money_to_bank
            # Отправляем деньги дилера в банк

    send_player_money_to_bank
    puts 'propustit'
    puts 'add_card'
    puts 'open_card'
    y = get.chomp.to_s
    case 
    propustit_hod_diller
    add_card_to_diller
  end

  def create_player(name)
    Player.new('name')
  end

  def seed
    coloda = %w(Туз 2 3 4 5 6 7 8 9 10 Валет Дама Король)
    Masti = 
    card1 = Card.new('2',2)
    card2 = Card.new('3',3)
    card3 = Card.new('4',4)
    card4 = Card.new('5',5)
    card5 = Card.new('6',6)
    card6 = Card.new('7',7)
    card7 = Card.new('8',8)
    card8 = Card.new('9',9)
    card9 = Card.new('10',10)

  end
end