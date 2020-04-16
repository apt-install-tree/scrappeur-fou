require_relative '../lib/02_cher_depute'

depute_test = main

describe "check if return an array" do
  it "should return not_nil" do
    expect(depute_test).not_to be_nil
  end
end

describe "check if return all deputies" do
  it "should return >= 5" do
    expect(depute_test.length).to be >= 5
  end
end