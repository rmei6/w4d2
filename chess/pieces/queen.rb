require_relative "piece"
require_relative "../slideable"

class Queen < Piece
  include Slideable
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = :queen
  end
  
  private
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end