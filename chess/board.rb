require_relative "piece"
require_relative "nullpiece"
class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    #@null_piece = Nullpiece.new
    arrange_pieces
  end

  def arrange_pieces
    (0...8).each do |col|
      rows[0][col] = Piece.new
      rows[1][col] = Piece.new
      rows[6][col] = Piece.new
      rows[7][col] = Piece.new
    end
  end

  def move_piece(color,start_pos,end_pos)
    raise "Can't put two same positions" if start_pos == end_pos
    raise "No piece at that position" if self[start_pos].nil?
    if !(0...8).include?(end_pos.first) || !(0...8).include?(end_pos.last)
      raise "Can't move to that position" 
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def [](pos)
    rows[pos.first][pos.last]
  end

  def []=(pos,value)
    rows[pos.first][pos.last] = value
  end
  private
  #attr_reader :null_piece
end