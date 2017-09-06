class Board

  attr_reader :grid

  def initialize
    @grid = [   [1,1,1],
                [1,1,1],
                [1,1,1]  ];
  end

  def claim_field(row, column, player)
    fail 'field occupied' if field_occupied?(row, column)
    @grid[row][column] = player
    fail 'Winner' if winner?
    fail 'Draw' if draw?
  end

  private

  def field_occupied?(row, column)
    @grid[row][column] != 1
  end

  def winner?
    @grid.each do |row|
      return true if row.all? { |field| field === :X }
      return true if row.all? { |field| field === :O }
    end
    return true if @grid === [ [:X,1,1], [:X,1,1], [:X,1,1] ];
    return true if @grid === [ [:O,1,1], [:O,1,1], [:O,1,1] ];
    return true if @grid === [ [1,:X,1], [1,:X,1], [1,:X,1] ];
    return true if @grid === [ [1,:O,1], [1,:O,1], [1,:O,1] ];
    return true if @grid === [ [1,1,:X], [1,1,:X], [1,1,:X] ];
    return true if @grid === [ [1,1,:O], [1,1,:O], [1,1,:O] ];
    return true if @grid === [ [:X,1,1], [1,:X,1], [1,1,:X] ];
    return true if @grid === [ [:O,1,1], [1,:O,1], [1,1,:O] ];
    return true if @grid === [ [1,1,:X], [1,:X,1], [:X,1,1] ];
    return true if @grid === [ [1,1,:O], [1,:O,1], [:O,1,1] ];
    false
  end

  def draw?
    @grid.each do |row|
      row.each do |field|
        return false if field === 1
      end
    end
    true
  end

end
