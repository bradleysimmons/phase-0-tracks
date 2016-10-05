# pseudocode a class for a word-guessing game that meets the 
# following specifications. Assume your driver code will handle 
# input and output as far as the user is concerned. In other words, 

# write a class designed for a computer program to use, not one 
# designed for a human to use directly, then use driver code to 
# bridge the gap between human and Ruby object.

# One user can enter a word (or phrase, if you would like your 
# game to support that), and another user attempts to guess the word.

# write a method to store word
# write a method to break secret word string into array
# write a method to generate correct guess array
# write a method to store guess limit
# write a method to store guess count
# write a method to store guesses

# guesses are limited, and the number of guesses available is related 
# to the length of the word.

# write a loop that increases with number of guesses
# and stops after the length has been reached

# repeated guesses do not count against the user.

# the loop only increases for a unique guess

# the guessing player receives continual feedback on the current state 
# of the word. So if the secret word is "unicorn", the user will start 
# out seeing something like "_ _ _ _ _ _ _", which would become "_ _ _ c _ _ _" 
# after the user enters a guess of "c".

# write a method that prints letter if input has been matched
# or else, prints "_"

# the user should get a congratulatory message if they win, and a taunting 
# message if they lose.

# write method for congratulatory message, loser message

# write a method that prints message if printed string matches secret word input

class Word_game

  attr_reader :secret_word, :guess_limit,:congratulatory_message, :losing_message
  attr_accessor :current_guess, :guesses, :guess_count

  def initialize(word)
    @secret_word = word.split("")
    @current_guess = ("-" * word.length).split("")
    @guess_count = 0
      
      if word.length > 10
        @guess_limit = word.length + 3
      elsif word.length * 2 > 10
        @guess_limit =  10
      else
        @guess_limit = word.length * 2
      end
    
    @guesses = []
    @congratulatory_message = "you won!"
    @losing_message = "you lost!"
    @valid_string = "abcdefghijklmnopqrstuvwxyz"
  end

  def check_if_already_guessed(guess)
    @guesses.include?(guess)
  end
    

  def check_if_in_word(guess)
    @secret_word.include?(guess)
  end

  def store_guess_in_guesses(guess)
    @guesses.push(guess)
  end

  def update_current_guess(guess)

    # find index numbers where guess = a letter in secret word
    # replace
   
    @secret_word.each_with_index do |letter, index|
      if guess == letter
        @current_guess[index] = @secret_word[index]
      end
    end
  end   

  def check_if_game_over
    @current_guess == @secret_word || (@guess_limit - @guess_count) == 0
  end

  def guess_valid_input(guess)
    @valid_string.include?(guess)
  end

  def secret_word_valid_input(secret_word)
    secret_word_array = secret_word.split("")

    secret_word_array.each do |character|
      @valid_string.include?(character)
    end
  end
end


#### driver code
    
    
    puts "player one:"
    until
      puts "please enter the secret word:"

      secret_word = gets.chomp
      secret_word = secret_word.downcase
      word = Word_game.new(secret_word)

      # have to check after initializing instance to gain access to method

        if word.secret_word_valid_input(secret_word) == false 
             puts "invalid input: no spaces, numbers, or symbols"
             puts "\n"
        else
          break
        end
    end

    puts "\n"
    puts "player two:"
    puts "the secret word is #{secret_word.length} characters long"

    until
      puts "\n"
      puts "you have #{(word.guess_limit - word.guess_count)} guesses remaining"
      puts "please guess a letter:"
      guess = gets.chomp
      guess = guess.downcase
      if word.guess_valid_input(guess) == true
        if word.check_if_already_guessed(guess) == false
          if word.check_if_in_word(guess) == true
            puts "match"
            word.store_guess_in_guesses(guess)
            word.update_current_guess(guess)
            puts "secret word: #{word.current_guess.join("")}"
            word.guess_count += 1
            if word.check_if_game_over == true
              puts "\n"
              puts word.congratulatory_message
              puts "the secret word is: #{word.secret_word.join("")}"
              break
            end
          else
            puts "no match"
            word.store_guess_in_guesses(guess)
            puts "secret word: #{word.current_guess.join("")}"
            word.guess_count += 1
            if word.check_if_game_over == true
              puts "\n"
              puts word.losing_message
              puts "the secret word is: #{word.secret_word.join("")}"
              break
            end
          end
        else
          puts "letter already guessed"
        end
      else
        puts "invalid input: single letter only"
      end
    end
