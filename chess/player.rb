require_relative "display"
class Player
  attr_reader :color, :display
  def initialize(symbol,display)
    @color = symbol
    @display = display
  end
end