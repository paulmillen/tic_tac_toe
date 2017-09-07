class Game

  require_relative './board'

  attr_reader :current_player

  def initialize(board = Board.new)
    @current_player = :X
    @board = board
  end

  def turn(row, column, player = @current_player)
    @board.claim_field(row, column, player)
    turn_over(player)
  end

  private

  def turn_over(player)
    player === :X ? @current_player = :O : @current_player = :X
  end

end
