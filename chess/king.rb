require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = "king"
  end
  
  private
  def move_dirs
    "one"
  end
end