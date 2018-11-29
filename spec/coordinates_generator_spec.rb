describe 'CoordsGenerator' do

  before(:each) do
    @cord = CoordsGenerator.new
  end

  it "should return a longitude value of a float" do
    expect(@cord.generate_longitude).to be_kind_of Float
  end

  it "should return a latitude value of a float" do
    expect(@cord.generate_latitude).to be_kind_of Float
  end

  it "should return values for the longitude between -180 and 180" do
    expect(@cord.generate_longitude).to be_between(-180,180).inclusive
  end

  it "should return values for the latitude between -90 and 90" do
    expect(@cord.generate_latitude).to be_between(-90,90).inclusive
  end

  it "should return a integer value for the iterator random number between 0 to 39" do
    expect(@cord.generate_number).to be_kind_of Integer
    expect(@cord.generate_number).to be_between(0,39).inclusive
  end

  it "should always return two numbers in the array" do
    expect(@cord.compare_two_different_numbers).to be_kind_of Array
    expect(@cord.compare_two_different_numbers.length).to eq 2
  end

  it "should always return two different numbers" do
    expect(@cord.compare_two_different_numbers[0]).not_to eq (@cord.compare_two_different_numbers[1])
  end

end
