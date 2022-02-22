require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable

  def initialize(symbol,board,pos)
    super
    @symbol = "queen"
  end

  def symbol
    color
  end
  private
  def move_dirs
    "both"
  end
end