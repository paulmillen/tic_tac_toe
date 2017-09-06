class Game

  attr_reader :current_player

  def initialize(board = Board.new)
    @current_player = :X
    @board = board
  end

  def turn(row, column, player = @current_player)
    fail 'field occupied' if @board.field_occupied?(row, column)
    @board.claim_field(row, column, player)
    fail 'Winner' if @board.winner?
    fail 'Draw' if @board.draw?
    turn_over(player)
  end

  private

  def turn_over(player)
    player === :X ? @current_player = :O : @current_player = :X
  end

end
