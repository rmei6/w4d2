require_relative "piece"

class Pawn < Piece
  attr_reader :symbol
  def initialize(symbol,board,pos)
    super
    @symbol = "pawn"
  end

  def moves
    positions = []
    steps = [[1,0],[0,1],[0,-1]]
    steps.each do |math|
      row,col = pos
      row += math.first
      col += math.last
      positions << [row,col]
    end
    positions
  end

  private
  def at_start_row?
    if color == "white"
      return pos.first == 1
    else
      return pos.first == 6
    end
  end

  def forward_dir
    row,col = pos
    if color == "white"
      return board[[row,col+1]].is_a?(NullPiece) ? 1 : -1
    else
      return board[[row,col-1]].is_a?(NullPiece) ? 1 : -1
    end
  end

  def forward_steps
    row,col = pos
    possible = []
    if color == "white"
      possible << [row+1,col]
      possible << [row+2,col] if at_start_row?
    else
      possible << [row-1,col]
      possible << [row-2,col] if at_start_row?
    end
    return possible
  end

  def side_attacks
    attacks = []
    row,col = pos
    if color == "white"
      attacks << [row+1,col+1] if !board[[row+1,col+1]].is_a?(NullPiece) && board[[row+1,col+1]].color != "white"
      attacks << [row+1,col-1] if !board[[row+1,col-1]].is_a?(NullPiece) && board[[row+1,col-1]].color != "white"
    else
      attacks << [row-1,col+1] if !board[[row-1,col+1]].is_a?(NullPiece) && board[[row-1,col+1]].color == "white"
      attacks << [row-1,col-1] if !board[[row-1,col-1]].is_a?(NullPiece) && board[[row-1,col-1]].color == "white"
    end
    attacks
  end
end