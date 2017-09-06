describe Game do

  subject(:game) { described_class.new }

  describe '#current_player' do
    it "returns the player whose current turn it is" do
      expect(game.current_player).to eq :X
    end
  end

  describe '#turn' do

    it "changes the current player" do
      game.turn(0,0)
      expect(game.current_player).to eq :O
    end

    it 'fails if the grid is full' do
      game.turn(0,0)
      game.turn(0,1)
      game.turn(0,2)
      game.turn(1,1)
      game.turn(1,0)
      game.turn(1,2)
      game.turn(2,1)
      game.turn(2,0)
      expect { game.turn(2,2) }.to raise_error 'Draw'
    end

    it 'fails if a row is filled with Xs' do
      game.turn(0,0,:X)
      game.turn(0,1,:X)
      expect { game.turn(0,2,:X) }.to raise_error 'Winner'
    end

    it 'fails if a row is filled with Os' do
      game.turn(0,0,:O)
      game.turn(0,1,:O)
      expect { game.turn(0,2,:O) }.to raise_error 'Winner'
    end

    it 'continues if a row is filled with Xs and Os' do
      game.turn(0,0,:X)
      game.turn(0,1,:O)
      expect { game.turn(0,2) }.not_to raise_error
    end

    it 'fails if a column is filled with Xs' do
      game.turn(0,0,:X)
      game.turn(1,0,:X)
      expect { game.turn(2,0,:X) }.to raise_error 'Winner'
    end

    it 'fails if a column is filled with Os' do
      game.turn(0,0,:O)
      game.turn(1,0,:O)
      expect { game.turn(2,0,:O) }.to raise_error 'Winner'
    end

    it 'continues if a column is filled with Xs and Os' do
      game.turn(0,0,:O)
      game.turn(1,0,:X)
      expect { game.turn(2,0,:O) }.not_to raise_error
    end

    it 'fails if a diagonal is filled with Xs' do
      game.turn(0,0,:X)
      game.turn(1,1,:X)
      expect { game.turn(2,2,:X) }.to raise_error 'Winner'
    end

    it 'fails if a diagonal is filled with Os' do
      game.turn(0,0,:O)
      game.turn(1,1,:O)
      expect { game.turn(2,2,:O) }.to raise_error 'Winner'
    end

    it 'continues if a diagonal is filled with Xs and Os' do
      game.turn(0,0,:X)
      game.turn(1,1,:O)
      expect{ game.turn(2,2,:X) }.not_to raise_error
    end
  end

end
