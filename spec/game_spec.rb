describe Game do

  subject(:game) { described_class.new }

  describe 'player one' do
    it 'exists' do
      expect(game.player_one).not_to be_nil
    end
  end

  describe 'player two' do
    it 'exists' do
      expect(game.player_two).not_to be_nil
    end
  end

end
