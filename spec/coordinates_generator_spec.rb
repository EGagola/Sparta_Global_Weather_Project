describe 'CoordsGenerator' do

  before(:each) do
    @cord = CoordsGenerator.new
  end

  it "should return a longitude value of a float" do
    expect(@cord.generate_longitude).to be_kind_of Float
    expect(@cord.generate_longitude.round).to eq 2
  end

  it "should return a latitude value of a float" do
    expect(@cord.generate_latitude).to be_kind_of Float
  end

  it "should return values for the longitude between -90 and 90" do
    expect(@cord.generate_longitude).to be_between(-90,90).inclusive
  end

  it "should return values for the latitude between -180 and 180" do
    expect(@cord.generate_latitude).to be_between(-180,180).inclusive
  end

end
