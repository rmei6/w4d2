require_relative "piece"
require_relative "../slideable"

class Bishop < Piece
  include Slideable
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = "bishop"
  end

  private
  def move_dirs
    "diagonally"
  end
end