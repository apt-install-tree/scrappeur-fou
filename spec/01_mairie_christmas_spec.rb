require_relative '../lib/01_mairie_christmas'

mairie_test = main  # Evite de lancer le test en boucle (+ que 2 fois)

def mairie_present?(mairie, mairie_test)
    a = false
    mairie_test.map { |i|
    if i.keys == [mairie] then
        a = true
    end
    }
    return a
end

describe "test if main currency are there" do
  it "should return ableiges" do    
    expect(mairie_present?("ableiges", mairie_test)).to be true
  end
end

describe "test if 1st are there" do
  it "should return ableiges in first place" do    
    expect(mairie_test[0].key?("ableiges")).to be true
  end
end

describe "test if 2nd are there" do
  it "should return ETH" do    
    expect(mairie_present?("aincourt", mairie_test)).to be true
  end
end

describe "test if 3rd are there" do
  it "should return ambleville" do    
    expect(mairie_present?("ambleville", mairie_test)).to be true
  end
end

describe "check if return an array" do
  it "should return not_nil" do
    expect(mairie_test).not_to be_nil
  end
end

describe "check if return all the mairie" do
  it "should return more than 100" do
    expect(mairie_test.length).to be > 100
  end
end