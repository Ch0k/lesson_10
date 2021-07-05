require_relative 'player'
require_relative 'card'
require_relative 'diller'


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
    # Выводим количество очков игрока
    player_points
    # Отправляем деньги пользователя в банк
    send_player_money_to_bank
    # Отправляем деньги дилера в банк
    send_diller_money_to_bank
    player_points
    card_monitor
    hod_igroka
  end

  def create_player(name)
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
    puts "Карты игрока"
    @player1.cards.each { |cards| puts "#{cards.name}" }
  end

  def card_monitor_diller
    puts "Карты диллера"
    @diller1.cards.each { |cards| puts "#{cards.name}" }
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
        if @diller1.points < 17 
          add_card_to_diller
          hod_igroka2
        else
          hod_igroka2
        end
      when 2
        add_card
        player_points
        card_monitor
        if @diller1.points < 17 
          add_card_to_diller
          open_card
        else
          open_card
        end
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

  def open_card
    player_points
    card_monitor
    diller_points
    card_monitor_diller
    if (@player1.points > @diller1.points) && (@player1.points <= 21)
      puts "Player win"
      @player1.add_money
      @player1.points = 0
    elsif (@player1.points > @diller1.points) && (@player1.points > 21)
      puts "Diller win"
      @diller1.add_money
    elsif (@player1.points < @diller1.points) && (@player1.points < 21)
      puts "Diller win"
      @diller1.add_money
    else (@player1.points == @diller1.points) 
      puts "ravno"
    end
    @player1.points = 0
    @diller1.points = 0
    money_monitor_player
    money_monitor_diller
    puts "Сыграем еще?"
    puts "1 - Да"
    puts "2 - Нет"
    y = gets.chomp.to_i
    case y
      when 1
        game 
      when 2
        puts "Bye"
    end
  end

  def seed
    @znacheniya = [{'T': 11},
                    {'K': 10},
                    {'D': 10},
                    {'V': 10},
                    {'10': 10},
                    {'9': 9},
                    {'8': 8},
                    {'7': 7},
                    {'6': 6},
                    {'5': 5},
                    {'4': 4},
                    {'3': 3},
                    {'2': 2}]
    player1 = Player.new('Vasya')
    #@znacheniya = %w(2 3 4 5 6 7 8 9 10 V D K T)
    @masti = %w(<3 <> ^ +)
    #@ochki = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    @coloda = @znacheniya.product(@masti)
    #@coloda.map! { |x| x.join } 
    #print @znacheniya
    #print @coloda
    @cards = []
    @coloda.each do |x, y|
      x.each do |key,value| 
        @key = key
        @value = value
      end
      ddd = @key.to_s + y.to_s
      @cards << Card.new(ddd, @value)
    end
    #print @cards
    #@coloda2 = @coloda.product(@ochki)
    #[ "a", "b", "c" ].join        #=> "abc"
    #for i in 1..5
    # k = i.to_s
    # [1,2,3].product([4,5])     #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
    #a.sample         #=> 7
    #'card' + 'k' = Card.new('k', i)
    #@coloda << 'card' + 'k'
    #end
    #print @coloda2
    #@cards = []
    #@coloda.each do |i| 
     # @cards << Card.new(i, i)
    #end
     # print @cards
     #@sample_cards = []
    #@sample_cards << @cards.sample
    #@sample_cards << @cards.sample
    #print @cards.sample

  end
end

bj = BlackJack.new
bj.seed
