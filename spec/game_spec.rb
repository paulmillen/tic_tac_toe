describe Game do

  subject(:game) { described_class.new }

  describe '#player_X' do
    it 'returns X' do
      expect(game.player_X).to eq 'X'
    end
  end

  describe '#player_O' do
    it 'returns O' do
      expect(game.player_O).to eq 'O'
    end
  end

  describe '#current_turn' do
    it "returns the player whose current turn it is" do
      expect(game.current_turn).to eq 'X'
    end
  end

  describe '#board' do
    it 'is an empty TicTacToe board upon instantiation' do
      expect(game.board).to eq [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
    end
  end

  describe '#claim_field' do
    it 'allows a player to claim an empty field' do
      game.claim_field(1,1,game.player_X)
      expect(game.board).to eq [[1, 1, 1], [1, 'X', 1], [1, 1, 1]]
    end

    it 'raises an error if the field is not empty' do
      game.claim_field(1,1,game.player_X)
      expect { game.claim_field(1,1,game.player_O) }.to raise_error 'field occupied'
    end
  end

  describe '#over?' do
    it 'returns false if the grid has spaces' do
      expect(game.over?).to be false
    end

    it 'returns true if the grid is full' do
      game.claim_field(0,0,game.player_X)
      game.claim_field(0,1,game.player_O)
      game.claim_field(0,2,game.player_X)
      game.claim_field(1,1,game.player_O)
      game.claim_field(1,0,game.player_X)
      game.claim_field(1,2,game.player_O)
      game.claim_field(2,1,game.player_X)
      game.claim_field(2,0,game.player_O)
      game.claim_field(2,2,game.player_X)
      expect(game.over?).to be true
    end
  end

end
