module Stepable
  def moves
    positions = []
    dir = move_dirs
    steps = []
    case dir
      when "L"
        steps.concat([[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]])
      when "one"
        steps.concat([[1,0],[0,1],[-1,0],[0,-1]])
      else
        return []
    end
    steps.each do |math|
      row,col = pos
      row += math.first
      col += math.last
      positions << [row,col]
    end
    positions
  end

  private
  def moves_diff
    nil
  end
end