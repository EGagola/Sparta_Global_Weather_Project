# describe 'CoordsGenerator' do
#
#   before(:all) do
#     @coord = ParseJSON.new
#     @random_number = @coord.generate_random_number
#     @longitude = @coord.get_coord(@random_number,'lon')
#     @latitude = @coord.get_coord(@random_number,'lat')
#     @length = @coord.get_json_length
#   end
#
#   it "should return a longitude value of a float or an integer" do
#     expect(@longitude).to be_kind_of(Float).or be_kind_of(Integer)
#   end
#
#   it "should return a latitude value of a float or an integer" do
#     expect(@latitude).to be_kind_of(Float).or be_kind_of(Integer)
#   end
#
#   it "should have a json length of 209579" do
#     expect(@length).to eq 209579
#   end
#
#   it "should return values for the longitude between -180 and 180" do
#     expect(@longitude).to be_between(-180,180).inclusive
#   end
#
#   it "should return values for the latitude between -90 and 90" do
#     expect(@latitude).to be_between(-90,90).inclusive
#   end
#
#   it "should return a integer value for the iterator random number between 0 the length of the json" do
#     expect(@random_number).to be_kind_of Integer
#     expect(@random_number).to be_between(0,@length).inclusive
#   end
#
# end
