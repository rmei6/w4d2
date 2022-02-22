require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

  def initialize(symbol,board,pos)
    super
  end
  
  def symbol
    color
  end
  private
  def move_dirs
    "one"
  end
end