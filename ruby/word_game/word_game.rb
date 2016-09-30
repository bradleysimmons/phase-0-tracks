class Word_game

  attr_reader :secret_word
  attr_accessor :current_guess
  attr_reader :guess_limit
  attr_accessor :guess_count
  attr_accessor :guesses
  attr_reader :congratulatory_message
  attr_reader :losing_message

  def initialize(word)
    @secret_word = word.split("")
    @current_guess = []
      word.length.times do |character|
        @current_guess << "-"
      end
    @guess_limit =  word.length * 3
    @guess_count = 0
    @guesses = []
    @congratulatory_message = "you won!"
    @losing_message = "you lost!"
  end

  def check_if_already_guessed(guess)
    if @guesses.empty?
      return false
    else
      @guesses.each do |letter|
        if guess != letter
          return false
        end
      end
    end
  end

  def check_if_in_word(guess)
    if @secret_word.index(guess) != nil
      return true
    end
  end

  def store_guess_in_guesses(guess)
    @guesses.push(guess)
  end

  def update_current_guess(guess)
     matches = []

    # find index numbers where guess = a letter in secret word
    # store in matches array

    index_number = 0
    @secret_word.each do |letter|
      if guess == letter
        matches.push(index_number)
      end
    index_number += 1
    end
    
    # delete "-" at those index numbers in current guess array
    # insert guess at those index numbers in current guess array

    matches.each do |index_number|
      @current_guess.delete_at(index_number)
      @current_guess.insert(index_number, guess)
    end

    return @current_guess
  end   

  def check_if_game_over
    if @current_guess == @secret_word
      return true
    end
  end

end


#### driver code

    puts "player one:"
    puts "please enter the secret word:"

    secret_word = gets.chomp
    word = Word_game.new(secret_word)

    
    puts "player two:"
    puts "the secret word is #{secret_word.length} characters long"

    until word.guess_count == word.guess_limit 
      if word.check_if_game_over == true
        puts word.congratulatory_message
        break
      end
      puts "please guess a letter"
      guess = gets.chomp
      if word.check_if_already_guessed(guess) == false
        if word.check_if_in_word(guess) == true
          puts "match"
          word.store_guess_in_guesses(guess)
          word.update_current_guess(guess)
          p word.current_guess
          word.guess_count += 1
        else
          puts "letter not found"
          word.store_guess_in_guesses(guess)
          p word.current_guess
          word.guess_count += 1
        end
      end
    end


  # for tomorrow:
    # stop if problem solved
    # check to see if storing guesses properly
