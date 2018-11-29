class CoordsGenerator

  def generate_longitude
    long = rand(-90.0...90.0).round(1)
  end

  def generate_latitude
    lat = rand(-180.0...180.0).round(1)
  end

end
