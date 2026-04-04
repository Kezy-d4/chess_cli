# frozen_string_literal: true

describe Chess::Position do
  describe '#to_fen' do
    context 'with a default position' do
      subject(:position_default) do
        fen_parser_default = Chess::FENParser.new(Chess::DEFAULT_FEN)
        described_class.from_fen_parser(fen_parser_default)
      end

      it 'returns the default fen record' do
        expect(position_default.to_fen).to eq(Chess::DEFAULT_FEN)
      end
    end
  end
end
