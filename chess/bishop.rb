require_relative "piece"
require_relative "slideable"

class Bishop < Piece
  include Slideable

  def initialize(symbol,board,pos)
    super
  end

  def symbol
    color
  end
  private
  def move_dirs
    "diagonally"
  end
end