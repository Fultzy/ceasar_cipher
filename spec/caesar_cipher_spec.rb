# frozen_string_literal: true

require './lib/caesar_cipher'

## Indexies converted into corresponding letters
describe Cipher do
  let(:cipher) { Cipher.new }

  ## Shifting index according to offset
  describe '#offsetr5000' do
    context 'when sent an index value ' do
      it 'value offsets by given ammount' do
        cipher.offset = 10
        expect(cipher.offsetr5000(10, false)).to eql(20)
      end
    end

    context 'When letter is requested Capitalized' do
      it 'the index value increases by offset and 100' do
        cipher.offset = 5
        expect(cipher.offsetr5000(15, true)).to eql(120)
      end
    end

    context 'If new index value exceeds 26' do
      it 'new index wraps around array' do
        cipher.offset = 1
        expect(cipher.offsetr5000(26, false)).to eql(0)
      end
    end
    context 'If new index value exceeds 26 and is requested Capitalized' do
      it 'New index is wrapped and increases by 100' do
        cipher.offset = 1
        expect(cipher.offsetr5000(26, true)).to eql(100)
      end
    end
  end

  describe '#word_inator' do
    context 'when index value is over 99' do
      it 'returns capital letter.' do
        expect(cipher.word_inator([104])).to eql('E ')
      end
    end

    context 'If index value is less than 100' do
      it 'returns lowercase letter' do
        expect(cipher.word_inator([5])).to eql('f ')
      end
    end

    context 'when several numbers are passed'
    it 'a whole word is returned' do
      expect(cipher.word_inator([107, 4, 11, 11, 14])).to eql('Hello ')
    end
  end
end

## All core methods test
## IDK why im like this, this whole thing is a mess lol
describe '#caesar_cipher' do
  context 'When passed an entire string' do
    xit 'will replace the string with another according to offset' do
      cipher.offset = 4
      expect(cipher.caesar_cipher('Hello World')).to eql(%w[Lipps Zsvph])
    end
  end
end
