require_relative "piece"

class Pawn < Piece
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = :pawn
  end

  def moves
    forward_steps + side_attacks
  end

  private
  def at_start_row?
    if color == :white
      return pos.first == 1
    else
      return pos.first == 6
    end
  end

  def forward_dir
    row,col = pos
    if color == :white
      return 1
    else
      return -1
    end
  end

  def forward_steps
    row,col = pos
    possible = []
    pos1 = [row+forward_dir,col]
    pos2 = [row+(forward_dir*2),col]
    if board[pos1].is_a?(NullPiece)
      possible << pos1
      if at_start_row? && board[pos2].is_a?(NullPiece)
        possible << pos2
      end
    end
    return possible
  end

  def side_attacks
    attacks = []
    row,col = pos
    if color == :white
      pos = [[row+1,col+1],[row+1,col-1]]
      pos.select!{|coor| board.valid_pos?(coor)}
      pos.each do |coor|
        attacks << coor unless board[coor].is_a?(NullPiece) || board[coor].color == :white
      end
    else
      pos = [[row-1,col+1],[row-1,col-1]]
      pos.select!{|coor| board.valid_pos?(coor)}
      pos.each do |coor|
        attacks << coor unless board[coor].is_a?(NullPiece) || board[coor].color == :black
      end
    end
    attacks
  end
end