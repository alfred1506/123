require_relative 'game5'
require_relative 'player5'
require_relative 'deck5'
require_relative 'dealer5'

class Terminal
  def start
    puts 'Для начала игры введите свое имя:'
    player_name = gets.chomp.to_s
    @game = Game.new(player_name)
    game
  end

  def game
    @game.part1
    puts 'Вы получаете 2 карты'
    puts 'Диллер получает 2 карты'
    player_points(@game.player)
    puts '1 - Пропустить ход'
    puts '2 - Добавить карту'
    puts '3 - Открыть карты'
    choise = gets.chomp.to_i
    @game.part2(choise)

    player_points(@game.player)
    money_monitor_player(@game.player)
    dealer_points(@game.dealer)
    money_monitor_dealer(@game.dealer)

    if @game.end_game? == true
      puts 'Игра окончена!'
    else
      puts 'Сыграем еще?'
      puts '1 - ДА'
      puts '2 - НЕТ'
      z = gets.chomp.to_i
      case z
      when 1
        game
      when 2
        puts 'Игра окончена!'
      end
    end
  end

  def player_points(player)
    puts "Сумма очков игрока #{player.points}"
  end

  def dealer_points(dealer)
    puts "Сумма очков диллера #{dealer.points}"
  end

  def money_monitor_player(player)
    puts "Банк игрока #{player.money}"
  end

  def money_monitor_dealer(dealer)
    puts "Банк диллера #{dealer.money}"
  end
end
