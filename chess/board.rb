require_relative "pieces"
class Board
  attr_reader :rows
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8,@null_piece)}
    arrange_pieces
  end
      #%i(white black) -> [:white, :black]
  def arrange_pieces
    layout = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
    (0...8).each do |col|
      rows[0][col] = layout[col].new(:white,self,[0,col])
      rows[1][col] = Pawn.new(:white,self,[1,col])
      rows[6][col] = Pawn.new(:black,self,[6,col])
      rows[7][col] = layout[col].new(:black,self,[7,col])
    end
  end

  def move_piece(color,start_pos,end_pos)
    raise "Can't put two same positions" if start_pos == end_pos
    raise "No piece at that position" if self[start_pos].nil?
    raise "Can't move to that position" unless valid_pos?(end_pos)
    raise "Invalid start position" unless valid_pos?(start_pos)
    raise "Not your color" unless self[start_pos].color == color
    self[end_pos] = self[start_pos]
    self[start_pos] = null_piece
    self[end_pos].pos = end_pos
  end

  def valid_pos?(pos)
    pos.all? {|num| (0...8).include?(num)}
  end

  def [](pos)
    rows[pos.first][pos.last] if valid_pos?(pos)
  end

  def []=(pos,value)
    rows[pos.first][pos.last] = value if valid_pos?(pos)
  end

  def add_piece(piece,pos)
    self[pos] = piece if valid_pos?(pos)
  end

  def checkmate?(color)
    return false unless in_check?(color)
    moves = []
    rows.each do |row|
      row.each do |piece|
        moves.concat(piece.valid_moves) if piece.color == color
      end
    end
    moves.empty?
  end

  def in_check?(color)
    king_pos = find_king(color)
    moves = []
    rows.each do |row|
      row.each do |piece|
        if piece.color != color
          return true if piece.moves.include?(king_pos)
        end
      end
    end
    false
  end

  def find_king(color)
    rows.each do |row|
      row.each do |piece|
        return piece.pos if piece.is_a?(King) && piece.color == color
      end
    end
  end
  private
  attr_reader :null_piece
end