require 'comment'

describe Comment do
  subject(:comment) { described_class.new('Hello') }

  describe '#add' do
    it 'adds a new comment' do
      expect(comment.text).to eq 'Hello'
    end
  end
end
