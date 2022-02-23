require_relative "piece"
require "singleton"
require 'byebug'

class NullPiece < Piece
  include Singleton
  attr_reader :color,:symbol
  def initialize
    @color = nil
    @symbol = "null"
  end

  def moves
    []
  end
end