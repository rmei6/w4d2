require_relative "piece"
require_relative "nullpiece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"
class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @null_piece = NullPiece.instance
    arrange_pieces
  end

  def arrange_pieces
    (0...8).each do |col|
      rows[0][col] = Piece.new("white",self,[0,col])
      rows[1][col] = Piece.new("white",self,[1,col])
      rows[6][col] = Piece.new("black",self,[6,col])
      rows[7][col] = Piece.new("black",self,[7,col])
    end
    (0...8).each do |col|
      (2..5).each do |row|
        rows[row][col] = null_piece
      end
    end
  end

  def move_piece(color,start_pos,end_pos)
    raise "Can't put two same positions" if start_pos == end_pos
    raise "No piece at that position" if self[start_pos].nil?
    if !(0...8).include?(end_pos.first) || !(0...8).include?(end_pos.last)
      raise "Can't move to that position" 
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = null_piece
    self[end_pos].pos = end_pos
  end

  def [](pos)
    rows[pos.first][pos.last]
  end

  def []=(pos,value)
    rows[pos.first][pos.last] = value
  end
  private
  attr_reader :null_piece
end