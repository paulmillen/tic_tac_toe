class Game

  attr_reader :current_turn, :board

  def initialize
    @current_turn = :X
    @board = [  [1,1,1],
                [1,1,1],
                [1,1,1]  ];
  end

  def turn(row, column, player = @current_turn)
    fail 'field occupied' if field_occupied?(row, column)
    claim_field(row, column, player)
    fail 'Winner' if winner?
    fail 'Draw' if draw?
    turn_over(player)
  end

  private

  def field_occupied?(row, column)
    @board[row][column] != 1
  end

  def claim_field(row, column, player)
    @board[row][column] = player
  end

  def turn_over(player)
    player === :X ? @current_turn = :O : @current_turn = :X
  end

  def draw?
    @board.each do |row|
      row.each do |field|
        return false if field === 1
      end
    end
    true
  end

  def winner?
    @board.each do |row|
      return true if row.all? { |field| field === :X }
      return true if row.all? { |field| field === :O }
    end
    return true if @board === [ [:X,1,1], [:X,1,1], [:X,1,1] ];
    return true if @board === [ [:O,1,1], [:O,1,1], [:O,1,1] ];
    return true if @board === [ [1,:X,1], [1,:X,1], [1,:X,1] ];
    return true if @board === [ [1,:O,1], [1,:O,1], [1,:O,1] ];
    return true if @board === [ [1,1,:X], [1,1,:X], [1,1,:X] ];
    return true if @board === [ [1,1,:O], [1,1,:O], [1,1,:O] ];
    return true if @board === [ [:X,1,1], [1,:X,1], [1,1,:X] ];
    return true if @board === [ [:O,1,1], [1,:O,1], [1,1,:O] ];
    return true if @board === [ [1,1,:X], [1,:X,1], [:X,1,1] ];
    return true if @board === [ [1,1,:O], [1,:O,1], [:O,1,1] ];
    false
  end

end
