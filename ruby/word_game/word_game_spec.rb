require_relative "Word_game"

describe Word_game do

  let(:secret_word) { Word_game.new("secret") }

  

  it "stores secret word as split array upon initialization" do
    expect(secret_word.secret_word).to eq (["s", "e", "c", "r", "e", "t"])
  end

  it "stores current guess array upon initialization" do
    expect(secret_word.current_guess).to eq (["-", "-", "-", "-", "-", "-"])
  end

  it "stores guess limit upon initialization" do
    expect(secret_word.guess_limit).to eq (10)
  end

  it "stores guess count upon initialization" do
    expect(secret_word.guess_count).to eq (0)
  end

  it "stores guess count upon initialization" do
    expect(secret_word.guesses).to eq ([])
  end

  it "stores congratulatory message count upon initialization" do
    expect(secret_word.congratulatory_message).to eq ("you won!")
  end

  it "stores losing message upon initialization" do
    expect(secret_word.losing_message).to eq ("you lost!")
  end

  it "pushes guess into guesses array" do
    expect(secret_word.store_guess_in_guesses("a")).to eq (["a"])
  end

  it "confirm empty guesses array" do
    expect(secret_word.check_if_already_guessed("a")).to eq (false)
  end

  it "check if in word" do
    expect(secret_word.check_if_in_word("a")).to eq (false)
    expect(secret_word.check_if_in_word("e")).to eq (true)
  end

  it "update with correct guess" do
    expect(secret_word.update_current_guess("e")).to eq (["-", "e", "-", "-", "e", "-"])
  end

  it "validate word input" do
    expect(secret_word.secret_word_valid_input(" w ord ")).to eq (false)
    expect(secret_word.secret_word_valid_input("$word")).to eq (false)
    expect(secret_word.secret_word_valid_input("2word")).to eq (false)
    expect(secret_word.secret_word_valid_input("word")).to eq (nil)
  end

  it "validate word input" do
    expect(secret_word.guess_valid_input(" ")).to eq (false)
    expect(secret_word.guess_valid_input("e")).to eq (true)
  end

end