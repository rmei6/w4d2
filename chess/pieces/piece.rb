require "byebug"
class Piece
  attr_reader :color,:board
  attr_accessor :pos

  def initialize(symbol,board,pos)
    @color = symbol
    @board = board
    @pos = pos        #use board.place piece during initialization to place piece
  end

  def valid_moves
    moves
    poss = HORIZONTAL_DIRS + DIAGONAL_DIRS
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
        else
          valid.concat(direction) if i+1 == direction.length
        end
      end
    end
    valid
  end

  def to_s
    symbol
  end
end