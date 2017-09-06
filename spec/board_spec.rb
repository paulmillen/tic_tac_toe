describe Board do

  subject(:board) { described_class.new }

  describe '#grid' do
    it 'is an empty TicTacToe board upon instantiation' do
      expect(board.grid).to eq [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
    end
  end

end
