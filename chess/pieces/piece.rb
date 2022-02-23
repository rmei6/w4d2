require "byebug"
class Piece
  attr_reader :color,:board
  attr_accessor :pos

  def initialize(symbol,board,pos)
    @color = symbol
    @board = board
    @pos = pos        #can use board.place piece during initialization to place piece
  end

  def valid_moves
    valid = []
    moves.each do |pos|
      valid << pos unless move_into_check?(pos)
    end
    valid
  end

  def to_s
    symbol.to_s
  end

  def Symbol
    symbol
  end

  private
  def my_dup
    new_board = Board.new
    black = {:Rook=>[],:Bishop=>[],:Queen=>[],:Knight=>[],:King=>[],:Pawn=>[]}
    white = {:Rook=>[],:Bishop=>[],:Queen=>[],:Knight=>[],:King=>[],:Pawn=>[]}
    (0...8).each do |i|
      (0...8).each do |j|
        piece = board[[i,j]]
        unless piece.is_a?(NullPiece)
          if piece.color == :white
            white[piece.class] << piece.pos
          else
            black[piece.class] << piece.pos
          end
        end
        new_board[[i,j]] = new_board.null_piece
      end
    end
    black.each_pair do |role,pos|
      new_board[pos] = role.new(:black,new_board,pos)
    end
    white.each_pair do |role,pos|
      new_board[pos] = role.new(:white,new_board,pos)
    end
    new_board
  end

  def move_into_check?(end_pos)
    new_board = my_dup
    new_board.move_piece(color,pos,end_pos)
    new_board.in_check?
  end

end