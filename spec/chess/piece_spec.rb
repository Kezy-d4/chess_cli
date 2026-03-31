# frozen_string_literal: true

describe Chess::Piece do
  describe '#white?' do
    context 'when white' do
      subject(:piece_white) { described_class.new(:white) }

      it 'returns true' do
        expect(piece_white.white?).to be(true)
      end
    end

    context 'when black' do
      subject(:piece_black) { described_class.new(:black) }

      it 'returns false' do
        expect(piece_black.white?).to be(false)
      end
    end
  end

  describe '#black?' do
    context 'when black' do
      subject(:piece_black) { described_class.new(:black) }

      it 'returns true' do
        expect(piece_black.black?).to be(true)
      end
    end

    context 'when white' do
      subject(:piece_white) { described_class.new(:white) }

      it 'returns false' do
        expect(piece_white.black?).to be(false)
      end
    end
  end

  describe '#to_s' do
    subject(:piece) { described_class.new(:white) }

    it 'returns a string describing the state' do
      expect(piece.to_s).to eq('The Piece is white.')
    end
  end
end
