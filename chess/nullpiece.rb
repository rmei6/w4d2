require_relative "piece"
require "singleton"
require 'byebug'

class NullPiece < Piece
  include Singleton
  def initialize
    @color = nil
    @symbol = ""
  end
  attr_accessor :color,:symbol
end