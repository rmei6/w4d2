require_relative "human_player"
require_relative 'board'
require_relative 'display'
class Game
  attr_reader :board, :display, :current_player, :player1, :player2
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(:white,@display)
    @player2 = HumanPlayer.new(:black,@display)
    @current_player = @player1
  end

  def play
    until board.checkmate?(player1.symbol) || board.checkmate?(player2.symbol)
      begin
      input = current_player.make_move
      board.move_piece(current_player.symbol,input.first,input.last)
      swap_turn!
      rescue e
        puts e.message
        retry
      end
    end
    notify_players
  end

  private
  def notify_players
    puts "Player with color #{@current_player.symbol} has won!!!!"
  end

  def swap_turn!
    if current_player == player1
      current_player = player2
    else
      current_player = player1
    end
  end
end