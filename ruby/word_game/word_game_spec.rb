require_relative "Word_game"

describe Word_game do

  let(:secret_word) { Word_game.new("secret") }
  

  it "stores secret word upon initialization" do
    expect(secret_word.secret_word).to eq ("secret")
  end

  it "splits secret word into array" do
    expect(secret_word.split_secret_word_to_array).to eq (["s", "e", "c", "r", "e", "t"])
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

end