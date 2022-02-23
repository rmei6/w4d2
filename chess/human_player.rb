require_relative "player"
require_relative 'board'

class HumanPlayer < Player
  def HumanPlayer(symbol,display)
    super
  end

  def make_move(board)
    input = nil
    until input != nil
      display.render
      input = display.cursor.get_input
      raise "Please enter a position" if input.nil?
      raise "Not a valid position" if board.valid_pos(input)
    end
    puts "Please enter new position, like 1 1"
    pos = gets.chomp.split(" ").map {|el| el.to_i}
    raise "invalid position" if board.valid_pos(pos)
    [input,pos]
  end

end