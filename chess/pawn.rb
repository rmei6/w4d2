require_relative "piece"

class Pawn < Piece
  def initialize(symbol,board,pos)
    super
  end

  def symbol
    color
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

  end

  def forward_steps
    
  end

  def side_attacks

  end
end