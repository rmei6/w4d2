require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable

  def initialize(symbol,board,pos)
    super
  end
  
  def symbol
    color
  end
  private
  def move_dirs
    "L"
  end
end