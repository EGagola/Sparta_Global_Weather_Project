describe NumberGenerator do

  before(:all) do
    @rand = NumberGenerator.new
    @two_random_numbers = @rand.generate_two_different_numbers
  end

  context "testing the generator that selects elements in the 5 day forecast" do

    it "should return an integer between 0 and 39" do
      expect(@rand.random).to be_between(0,39).inclusive
    end

    it "should always return two numbers in the array" do
      expect(@two_random_numbers).to be_kind_of Array
      expect(@two_random_numbers.length).to eq 2
    end

    it "should always return two different numbers" do
      expect(@two_random_numbers[0]).not_to eq (@two_random_numbers[1])
    end

  end

end
