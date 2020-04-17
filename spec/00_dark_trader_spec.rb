require_relative '../lib/00_dark_trader'

crypto_test = main  # Evite de lancer le test en boucle (+ que 2 fois)

def crypto_present?(coin, crypto_test)
    a = false
    crypto_test.map { |i|
    if i.keys == [coin] then
        a = true
    end
    }
    return a
end

describe "test if main currency are there" do
  it "should return BTC" do    
    expect(crypto_present?("BTC", crypto_test)).to be true
  end
end

describe "test if main currency are there" do
  it "should return BTC in first place" do    
    expect(crypto_test[0].key?("BTC")).to be true
  end
end

describe "test if main currency are there" do
  it "should return ETH" do    
    expect(crypto_present?("ETH", crypto_test)).to be true
  end
end

describe "test if main currency are there" do
  it "should return XRP" do    
    expect(crypto_present?("XRP", crypto_test)).to be true
  end
end

describe "check if return an array" do
  it "should return not_nil" do
    expect(crypto_test).not_to be_nil
  end
end

describe "check if return all the coin" do
  it "should return more than 100" do
    expect(crypto_test.length).to be > 100
  end
end
