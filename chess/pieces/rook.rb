require_relative "piece"
require_relative "../slideable"

class Rook < Piece
  include Slideable
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = :rook
  end

  private
  def move_dirs
    horizontal_dirs
  end
end