# frozen_string_literal: true

# this sucks, thank you.

class Cipher
  attr_reader :message
  attr_accessor :offset, :input

  def initialize
    @alpha = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    @offset = 0
    @input = nil
    @message = String.new
  end

  def user_input
    puts ' input message...'
    @input = 'Hello World'
    puts ' input encryption offset...'
    @offset = 25
    15.times { print '~~' }
    puts ' '
  end

  ########
  def caesar_cipher(string)
    string.split.each do |word|
      words = []
      word
      word.each_char do |letter|
        letter
        words.push(offsetr5000(@alpha.index(letter.upcase),
                               letter == letter.upcase))
      end
      word_inator(words)
    end
  end

  ########
  def offsetr5000(index, cap)
    new_index = index.to_i + @offset
    if cap == true
      capitalizer9000(new_index)
    elsif new_index > 26
      new_index - 27
    elsif new_index.negative?
      27 - new_index
    else
      new_index
    end
  end

  def capitalizer9000(new_index)
    if new_index > 26
      new_index + 100 - 27
    elsif new_index.negative?
      new_index + 100 - 27
    else
      new_index + 100
    end
  end

  ########
  def word_inator(array)
    puts "word: #{array}"
    word = String.new
    array.each do |num|
      # uppercase
      if num == 100
        word.concat(@alpha[0])
      elsif num > 99
        word.concat(num == 126 ? 'Z' : @alpha[num - 100].to_s)
        # lowercase
      else
        word.concat(num == 26 ? 'z' : @alpha[num].downcase)
      end
    end
    @message.concat(" #{word}")
  end

  ########
  def display
    15.times { print '~~' }
    puts ' '
    puts " output message: #{@message}"
    puts " offset Factor: #{@offset}"
    15.times { print '~~' }
    puts ' '
  end
end

cipher = Cipher.new
cipher.user_input

puts " Message: #{cipher.input}"
puts " Offset: #{cipher.offset}"

cipher.caesar_cipher(cipher.input)
cipher.display
