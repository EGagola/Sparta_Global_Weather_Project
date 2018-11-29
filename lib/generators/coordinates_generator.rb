class CoordsGenerator

  def generate_latitude
    long = rand(-90.0...90.0).round(1)
  end

  def generate_longitude
    lat = rand(-180.0...180.0).round(1)
  end

  def generate_number
    rand(0...39)
  end

  def compare_two_different_numbers
    different = false
    while(different == false) do
      two_numbers = [0, 0]
      two_numbers[0] = generate_number
      two_numbers[1] = generate_number
      if two_numbers[0]!=two_numbers[1]
        different = true
      end
    end
    two_numbers
  end

end
