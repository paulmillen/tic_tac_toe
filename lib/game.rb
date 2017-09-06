class Game

  attr_reader :player_X, :player_O, :current_turn
  attr_accessor :board

  def initialize
    @player_X = 'X'
    @player_O = 'O'
    @current_turn = @player_X
    @board = [  [1,1,1],
                [1,1,1],
                [1,1,1]  ];
  end

  def claim_field(row, column, player)
    fail 'field occupied' unless @board[row][column] === 1
    @board[row][column] = player
    turn_over
  end

  def over?
    @board.each do |row|
      row.each do |field|
        return false if field === 1
      end
    end
    true
  end

  private

  def turn_over
    @current_turn === @player_X ? @current_turn = @player_O : @current_turn = @player_X
  end

end
