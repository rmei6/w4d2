module Stepable
  def moves
    positions = []
    steps = move_dirs
    steps.each do |math|
      positions.concat(grow_unblocked_moves_in_dir(math.first,math.last))
    end
    positions
  end

  private
  def moves_diff
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    direction = []  
    row,col = pos
    row += dx
    col += dy
    return direction unless board.valid_pos?([row,col])
    if board[[row,col]].is_a?(NullPiece) || board[[row,col]].color != self.color
      direction << [row,col]
    end
    direction
  end
end