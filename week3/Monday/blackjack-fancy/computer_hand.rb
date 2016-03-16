require_relative 'hand'

class ComputerHand < Hand

  def hit?
    check_busted
    value < 16
  end

  def show_card
    cards.first
  end

  def check_busted
    busted?
  end

end
