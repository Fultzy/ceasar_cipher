#this sucks, thank you.
require 'pry'

def user_input
  puts " input message..."
  @input = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

  puts " input encryption offset..."
  @offset = 0
  30.times{print "~~"}
  puts " "
  @message = String.new
end

def caesar_cipher(string)
  counter = 0
  p string
  string.split.each do |word|
    counter += 1
    newWord = Array.new
    word.each_char do |letter|

      #uppercase letter
      if letter == letter.upcase
        letterIndex = @alpha.index(letter)
          newWord.push(offsetr5000(letterIndex,1))

      #lowercase letter
      elsif letter == letter.downcase
        letterIndex = @alpha.index(letter.upcase)
          newWord.push(offsetr5000(letterIndex,0))

      #symbols
      elsif @symbols.include(letter) {p "symbol"}
      puts "symbol"

      #other
      else
        puts "fix it again, Tony."
      end


    end
    puts " offset word ##{counter}: '#{word}'"
    p newWord
    word_inator(newWord)

  end
end


def offsetr5000(index,cap)
  newIndex = index.to_i + @offset
  if cap == 1
    if newIndex > 26
      newIndex - 27
      newIndex + 100
    elsif newIndex < 0
      26 - newIndex
      newIndex + 100
    else
      newIndex + 100
    end
  else
    if newIndex > 26
      newIndex - 27
    elsif newIndex < 0
      26 - newIndex
    else
      newIndex
    end
  end
end

def word_inator(array)
  word = String.new
  array.each do |num|

    #uppercase
    if num > 70
      word.concat(@alpha[num-100].to_s)

    #lowercase
    else
      word.concat(@alpha[num].to_s.downcase)
    end
  end
  p word
  @message << " #{word}"
end

def display
  30.times{print "~~"}
  puts " "
  puts " output message: #{@message}"
  puts " offset Factor: #{@offset}"
  30.times{print "~~"}
  puts " "
end

@alpha = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
@symbols = ["!", "@", "#", "$", "&", ".", ","]

user_input
caesar_cipher(@input)
display
