module Slideable
  def moves
    positions = []
    dir = move_dirs
    steps = []
    case dir
      when "diagonally"
        steps.concat(c)
      when "horizontally/vertically"
        steps.concat([[1,0],[0,1],[-1,0],[0,-1]])
      when "both"
        steps.concat([[1,1],[-1,1],[-1,-1],[1,-1],[1,0],[0,1],[-1,0],[0,-1]])
      else
        return []
    end
    steps.each do |math|
      row,col = pos
      until !(0...8).include?(row) || !(0...8).include?(col)
        row += math.first
        col += math.last
        positions << [row,col]
      end
    end
    positions
  end

  private
  def move_dirs
    nil
  end
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []
end