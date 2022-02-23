module Slideable
  def moves
    steps = move_dirs
    p steps
    positions = []
    steps.each do |math|
      positions += grow_unblocked_moves_in_dir(math.first,math.last)
    end
    positions
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private
  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    direction = []  
    row,col = pos
    row += dx
    col += dy
    while (0...8).include?(row) && (0...8).include?(col)
      if board[[row,col]].is_a?(NullPiece)
        direction << [row,col]
      elsif board[[row,col]].color != self.color
        direction << [row,col]
        break
      else
        break
      end
      row += dx
      col += dy
    end
    direction
  end

  HORIZONTAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]].freeze
  DIAGONAL_DIRS = [[1,1],[-1,1],[-1,-1],[1,-1]].freeze
end