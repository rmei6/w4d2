class Piece
  attr_reader :color,:board
  attr_accessor :pos
  def initialize(symbol,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    poss = moves
    valid = []
    poss.each do |direction|
      (0...direction.length).each do |i|
        if board[direction[i]].is_a?(Piece)
          if board[direction[i]].color == color
            valid.concat(direction[0...i])
          else
            valid.concat(direction[0..i])
          end
          break
        end
        valid.concat(direction) if i+1 == direction.length
      end
    end
    valid
  end
end