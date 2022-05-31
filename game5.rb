class Game
  attr_accessor :player, :dealer

  def initialize(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new
    @deck.generate
    @winner = []
  end

  def part1
    empty_cards
    player.empty_cards
    send_player_money_to_bank
    send_dealer_money_to_bank
    send_cards
    send_cards_to_dealer
  end

  def send_player_money_to_bank
    @player.send_money
    puts @player.money.to_s
  end

  def send_dealer_money_to_bank
    @dealer.send_money
    puts @dealer.money.to_s
  end

  def send_cards
    @player.receive_cards(@deck.cards.sample)
    @player.receive_cards(@deck.cards.sample)
  end

  def send_cards_to_dealer
    @dealer.receive_cards(@deck.cards.sample)
    @dealer.receive_cards(@deck.cards.sample)
  end

  def add_card_to_dealer
    @dealer.receive_cards(@deck.cards.sample)
  end

  def add_card_to_player
    @player.receive_cards(@deck.cards.sample)
  end

  def open_all_cards
    puts "Ваша общая сумма очков: #{@player.points}"
    puts "Общая сумма очков диллера #{@dealer.points}"
  end

  def part2(choise)
    case choise
    when 1
      if @dealer.points < 17
        add_card_to_dealer
        puts 'Диллер взял одну карту'
        part3
      else
        puts 'Диллер пропускает ход'
        part3
      end

    when 2
      add_card_to_player
      puts "Общая сумма очков (3 карты):#{@player.points}"
      if @dealer.points < 17
        add_card_to_dealer
        puts 'Диллер взял одну карту'
        who_win
      else
        puts 'Диллер пропускает ход'
        part3
      end

    when 3
      open_all_cards
      who_win

    end
  end

  def part3
    puts '1 - Добавить карту'
    puts '2 - Открыть карты'
    choise = gets.chomp.to_i
    case choise
    when 1
      add_card_to_player
      puts "Общая сумма очков (3 карты):#{@player.points}"
      if @dealer.points < 17
        add_card_to_dealer
        puts 'Диллер взял одну карту'
      else
        puts 'Диллер пропускает ход'
      end

    when 2
      open_all_cards

    end
    who_win
  end

  def who_win
    if (@player.points > @dealer.points) && (player.points <= 21)
      puts 'Вы выйграли!!!'
      @player.add_money(20)
      puts "Размер выйгрыша: 20, баланс:#{@player.money}"
      @winner << @player
    elsif (@player.points > @dealer.points) && (player.points > 21)
      puts 'Вы програли!!!! Побеждает диллер!'
      @dealer.add_money(20)
      puts "Вы програли: 10, баланс:#{@player.money}"
      @winner << @player
    elsif (@player.points < @dealer.points) && (dealer.points <= 21)
      puts 'Вы програли!!!! Побеждает диллер!'
      @dealer.add_money(20)
      puts "Вы програли: 10, баланс:#{@player.money}"
      @winner << @player
    elsif (@player.points < @dealer.points) && (dealer.points > 21)
      @player.add_money(20)
      puts 'Вы выйграли!!!'
      puts "Размер выйгрыша: 20, баланс:#{@player.money}"
      @winner << @player
    else
      (@player.points == @dealer.points)
      puts 'Ничья!'
      @player.add_money(10)
      @dealer.add_money(10)
      puts "Размер выйгрыша: 10, баланс:#{@player.money}"
    end
  end

  attr_writer :winner

  def end_game?
    true if @dealer.money.zero? || @dealer.money.negative? || @player.money.zero? || @player.money.negative?
  end

  def empty_cards
    @player.empty_cards
    @dealer.empty_cards
    @player.points = 0
    @dealer.points = 0
    @winner = []
  end
end
