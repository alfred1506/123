class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def generate
    @meaning = [{ 'T': 11 },
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
    @masti = %w[+ <3 ^ <>]
    @coloda = @meaning.product(@masti)
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
