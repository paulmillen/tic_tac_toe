describe Board do

  subject(:board) { described_class.new }

  describe '#grid' do
    it 'is an empty TicTacToe board upon instantiation' do
      expect(board.grid).to eq [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
    end
  end

  describe '#claim_field' do

    it 'returns draw string if the grid field is occupied' do
      board.claim_field(0,0,:X)
      board.claim_field(0,1,:O)
      board.claim_field(0,2,:X)
      board.claim_field(1,1,:O)
      board.claim_field(1,0,:X)
      board.claim_field(1,2,:O)
      board.claim_field(2,1,:X)
      board.claim_field(2,0,:O)
      expect(board.claim_field(2,2,:X)).to eq 'Draw'
    end

    it 'adds a symbol to the grid' do
      board.claim_field(1,1,:X)
      expect(board.grid).to eq [[1, 1, 1], [1, :X, 1], [1, 1, 1]]
    end

    it 'returns win string if the grid field is occupied' do
      board.claim_field(1,1,:X)
      expect { board.claim_field(1,1,:O) }.to raise_error 'field occupied'
    end

    it 'returns win string if a row is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(1,1,:O)
      board.claim_field(0,1,:X)
      board.claim_field(2,0,:O)
      expect(board.claim_field(0,2,:X)).to eq 'X Wins'
    end

    it 'returns win string if a row is filled with Os' do
      board.claim_field(0,0,:O)
      board.claim_field(0,1,:O)
      expect(board.claim_field(0,2,:O)).to eq 'O Wins'
    end

    it 'returns win string if a column is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(2,2,:O)
      board.claim_field(1,0,:X)
      board.claim_field(0,2,:O)
      expect(board.claim_field(2,0,:X)).to eq 'X Wins'
    end

    it 'returns win string if a column is filled with Os' do
      board.claim_field(0,0,:O)
      board.claim_field(0,1,:X)
      board.claim_field(1,0,:O)
      board.claim_field(2,1,:X)
      expect(board.claim_field(2,0,:O)).to eq 'O Wins'
    end

    it 'returns win string if a diagonal is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(0,1,:O)
      board.claim_field(1,1,:X)
      board.claim_field(1,2,:O)
      expect(board.claim_field(2,2,:X)).to eq 'X Wins'
    end

    it 'returns win string if a diagonal is filled with Os' do
      board.claim_field(0,2,:O)
      board.claim_field(0,0,:X)
      board.claim_field(1,1,:O)
      board.claim_field(2,1,:X)
      expect(board.claim_field(2,0,:O)).to eq 'O Wins'
    end
  end

end
