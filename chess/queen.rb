require_relative "piece"
require_relative "slideable"

class Queen < Piece

  def initialize(symbol,board,pos)
    super
  end

  include Slideable
  def symbol
    color
  end
  private
  def move_dirs
    "both"
  end
end