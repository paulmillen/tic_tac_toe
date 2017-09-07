class Board

  attr_reader :grid

  def initialize
    @grid = [   [1,1,1],
                [1,1,1],
                [1,1,1]  ];
  end

  def claim_field(row, column, player)
    fail ArgumentError, 'field occupied' if field_occupied?(row, column)
    @grid[row][column] = player
    return "#{player.to_s} Wins" if winner?
    return 'Draw' if draw?
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
    return true if @grid[0][0] === :X && @grid[1][0] === :X && @grid[2][0] === :X
    return true if @grid[0][0] === :O && @grid[1][0] === :O && @grid[2][0] === :O
    return true if @grid[0][1] === :X && @grid[1][1] === :X && @grid[2][1] === :X
    return true if @grid[0][1] === :O && @grid[1][1] === :O && @grid[2][1] === :O
    return true if @grid[0][2] === :X && @grid[1][2] === :X && @grid[2][2] === :X
    return true if @grid[0][2] === :O && @grid[1][2] === :O && @grid[2][2] === :O
    return true if @grid[0][0] === :X && @grid[1][1] === :X && @grid[2][2] === :X
    return true if @grid[0][0] === :O && @grid[1][1] === :O && @grid[2][2] === :O
    return true if @grid[0][2] === :X && @grid[1][1] === :X && @grid[2][0] === :X
    return true if @grid[0][2] === :O && @grid[1][1] === :O && @grid[2][0] === :O
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
