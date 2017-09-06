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

    it "passes claim_field to board" do
      board = spy('board')
      game = Game.new(board)
      game.turn(0,0)
      expect(board).to have_received(:claim_field)
    end
  end

end
