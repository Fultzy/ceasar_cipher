# frozen_string_literal: true

require './lib/caesar_cipher'

describe Cipher do
  describe '#word_inator' do
    it 'when a passed number is over 99 returns capital letter.' do
      cipher = Cipher.new
      expect(cipher.word_inator([104])).to eql(' E')
    end

    it 'if the number passed is less than 100 returns lowercase letter' do
      cipher = Cipher.new
      expect(cipher.word_inator([5])).to eql(' f')
    end

    it 'when several numbers are passed a whole word is returned' do
      cipher = Cipher.new
      expect(cipher.word_inator([107, 4, 11, 11, 14])).to eql(' Hello')
    end
  end

  describe '#offsetr5000' do
    it 'when sent a number will offset by a given ammount' do
      cipher = Cipher.new
      cipher.offset = 10
      expect(cipher.offsetr5000(10, false)).to eql(20)
    end

    it 'when sent a capital option the value should increase by 100' do
      cipher = Cipher.new
      cipher.offset = 5
      expect(cipher.offsetr5000(15, true)).to eql(120)
    end

    it 'if the letter requires wrapping around alpha with a negative number' do
      cipher = Cipher.new
      cipher.offset = 1
      expect(cipher.offsetr5000(26, false)).to eql(0)
    end

    it 'if the letter requires wrapping around alpha with a negative number capitalized' do
      cipher = Cipher.new
      cipher.offset = 1
      expect(cipher.offsetr5000(26, true)).to eql(100)
    end
  end

  describe '#caesar_cipher' do
    it 'will replace the string with another according to offset' do
      cipher = Cipher.new
      cipher.offset = 4
      expect(cipher.caesar_cipher('Hello World')).to eql(' Lipps Zsvph')
    end
  end
end
