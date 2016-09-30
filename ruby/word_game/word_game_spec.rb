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
    expect(secret_word.guess_limit).to eq (18)
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
    expect(secret_word.store_guess_in_guesses("a")).to eq (@guesses = ["a"])
  end

  it "confirm empty guesses array" do
    expect(secret_word.check_if_already_guessed("a")).to eq (false)
  end

  it "check if in word" do
    expect(secret_word.check_if_in_word("a")).to eq (nil)
    expect(secret_word.check_if_in_word("e")).to eq (true)
  end

  it "update with correct guess" do
    # expect(secret_word.update_current_guess("e")).to eq ([1, 4])
    expect(secret_word.update_current_guess("e")).to eq (["-", "e", "-", "-", "e", "-"])
  end

end