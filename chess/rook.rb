require_relative "piece"
require_relative "slideable"

class Rook < Piece
  include Slideable

  def initialize(symbol,board,pos)
    super
    @symbol = "rook"
  end

  def symbol
    color
  end
  private
  def move_dirs
    "horizontally/vertically"
  end
end