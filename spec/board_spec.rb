describe Board do

  subject(:board) { described_class.new }

  describe '#grid' do
    it 'is an empty TicTacToe board upon instantiation' do
      expect(board.grid).to eq [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
    end
  end

  describe '#claim_field' do

    it 'adds a symbol to the grid' do
      board.claim_field(1,1,:X)
      expect(board.grid).to eq [[1, 1, 1], [1, :X, 1], [1, 1, 1]]
    end

    it 'fails if the grid field is occupied' do
      board.claim_field(1,1,:X)
      expect { board.claim_field(1,1,:O) }.to raise_error 'field occupied'
    end

    it 'fails if a row is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(1,1,:O)
      board.claim_field(0,1,:X)
      board.claim_field(2,0,:O)
      expect { board.claim_field(0,2,:X) }.to raise_error 'Winner'
    end

    it 'fails if a row is filled with Os' do
      board.claim_field(0,0,:O)
      board.claim_field(0,1,:O)
      expect { board.claim_field(0,2,:O) }.to raise_error 'Winner'
    end

    it 'fails if a column is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(2,2,:O)
      board.claim_field(1,0,:X)
      board.claim_field(0,2,:O)
      expect { board.claim_field(2,0,:X) }.to raise_error 'Winner'
    end

    it 'fails if a column is filled with Os' do
      board.claim_field(0,0,:O)
      board.claim_field(1,0,:O)
      expect { board.claim_field(2,0,:O) }.to raise_error 'Winner'
    end

    it 'fails if a diagonal is filled with Xs' do
      board.claim_field(0,0,:X)
      board.claim_field(0,1,:O)
      board.claim_field(1,1,:X)
      board.claim_field(1,2,:O)
      expect { board.claim_field(2,2,:X) }.to raise_error 'Winner'
    end

    it 'fails if a diagonal is filled with Os' do
      board.claim_field(0,0,:O)
      board.claim_field(1,1,:O)
      expect { board.claim_field(2,2,:O) }.to raise_error 'Winner'
    end
  end

end
