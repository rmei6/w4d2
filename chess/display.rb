require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board,:cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)
  end
  
  def render
    system("clear")
    build_board.each { |row| puts row.join(" ")}
  end

  def build_board
    board.rows.map.with_index do |row,i|
      build_row(row,i)
    end
  end

  def build_row(row,i)
    row.map.with_index do |piece,j|
      colors = pos_colors(i,j)
      piece.to_s.colorize(colors)
    end
  end

  def pos_colors(i,j)
    if [i,j] == cursor.cursor_pos
      back = :blue
    else
      back = :red
    end
    {background: back, color: :white}
  end
end

board = Board.new
display = Display.new(board)
while true
  display.render
  display.cursor.get_input
end