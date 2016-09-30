class Word_game

  attr_reader :secret_word
  attr_accessor :current_guess
  attr_reader :guess_limit
  attr_accessor :guess_count
  attr_accessor :guesses
  attr_reader :congratulatory_message
  attr_reader :losing_message

  def initialize(word)
    @secret_word = word
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

  

  def split_secret_word_to_array
    @secret_word.split("")
  end

  
end
