require_relative "piece"
require_relative "../stepable"

class Knight < Piece
  include Stepable
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = "knight"  
  end

  private
  def move_dirs
    "L"
  end
end