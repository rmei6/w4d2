require_relative "piece"
require "singleton"
require 'byebug'

class NullPiece < Piece
  include Singleton
  attr_accessor :color,:symbol
  def initialize
    @color = nil
    @symbol = ""
  end

  def moves
    []
  end
end