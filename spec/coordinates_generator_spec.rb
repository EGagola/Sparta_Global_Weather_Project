# describe 'CoordsGenerator' do
#
#   before(:all) do
#     @cord = CoordsGenerator.new
#     @longitude = @cord.generate_longitude
#     @latitude = @cord.generate_latitude
#     @iterator_random_number = @cord.generate_number
#     @two_random_numbers = @cord.compare_two_different_numbers
#   end
#
#   it "should return a longitude value of a float" do
#     expect(@longitude).to be_kind_of Float
#   end
# =>
#   it "should return a latitude value of a float" do
#     expect(@latitude).to be_kind_of Float
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
#   it "should return a integer value for the iterator random number between 0 to 39" do
#     expect(@iterator_random_number).to be_kind_of Integer
#     expect(@iterator_random_number).to be_between(0,39).inclusive
#   end
#
#   it "should always return two numbers in the array" do
#     expect(@two_random_numbers).to be_kind_of Array
#     expect(@two_random_numbers.length).to eq 2
#   end
#
#   it "should always return two different numbers" do
#     expect(@two_random_numbers[0]).not_to eq (@two_random_numbers[1])
#
#   end
#
# end
