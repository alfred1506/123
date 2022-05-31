class Player
  attr_accessor :money, :points, :cards

  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @money = 100
  end

  def receive_cards(card)
    @cards << card
    @points += if card.name !~ /T/
                 card.point
               elsif (21 - @points) > 10
                 11
               else
                 1
               end
  end

  attr_reader :cards

  def send_money
    @money -= 10
  end

  def empty_cards
    @cards = []
  end

  def add_money(number)
    @money += number
  end
end
