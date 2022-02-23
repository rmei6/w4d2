module Slideable
  def moves
    dir = move_dirs
    steps = []
    dir = "diag"
    case dir
      when "diagonally"
        steps.concat([[1,1],[-1,1],[-1,-1],[1,-1]])
      when "horizontally/vertically"
        steps.concat([[1,0],[0,1],[-1,0],[0,-1]])
        dir = "hor"
      when "both"
        steps.concat([[1,1],[-1,1],[-1,-1],[1,-1],[1,0],[0,1],[-1,0],[0,-1]])
      else
        return []
    end
    steps.each do |math|
      dir = hor if math == [1,0]  #switch to horizontal dirs
      direction = []
      row,col = pos
      while (0...8).include?(row) && (0...8).include?(col)
        row += math.first
        col += math.last
        direction << [row,col]
      end
      HORIZONTAL_DIRS << direction if dir == "hor"
      DIAGONAL_DIRS << direction if dir == "diag"
    end
  end

  private
  def move_dirs
    nil
  end
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
end