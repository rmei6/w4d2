require_relative "piece"
require_relative "nullpiece"
class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @null_piece = Nullpiece.new
    arrange_pieces
  end

  def arrange_pieces
    (0...8).each do |col|
  end

  def move_piece(start_pos,end_pos)
    raise "No piece at that position" if self[start_pos].nil?
    if !(0...8).include?(end_pos.first) || !(0...8).include?(end_pos.last)
      raise "Can't move to that position" 
    end

  end
  private
  attr_reader :null_piece
end