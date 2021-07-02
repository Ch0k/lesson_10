require_relative 'player'
require_relative 'card'


class BlackJack

  def menu
    puts 'Введите имя игрока'
    x = gets.chomp.to_s
    create_player(x)
    puts 'Игрок получает 2 карты'
    send_cards
    puts 'Диллер получает 2 карты'
    send_cards_to_d

    # Выводим количество очков игрока
    #puts player_points
    # Отправляем деньги пользователя в банк

    #send_player_money_to_bank
            # Отправляем деньги дилера в банк

    #send_player_money_to_bank
    #puts 'propustit'
    #puts 'add_card'
    #puts 'open_card'
    #y = get.chomp.to_s
    #case 
    #propustit_hod_diller
    #add_card_to_diller
  end

  def create_player(name)
    @player1 = Player.new('name')
  end

  def send_cards
    @player1.receive_cards(@cards.sample)
    @player1.receive_cards(@cards.sample)
  end

  def send_cards_to_d
    
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
    player1.points
    player1.receive_cards(@cards.sample)
    player1.receive_cards(@cards.sample)
    player1.points
  end
end

bj = BlackJack.new
bj.seed