class CoordsGenerator

  def generate_latitude
    long = rand(-90.0...90.0).round(1)
  end

  def generate_longitude
    lat = rand(-180.0...180.0).round(1)
  end

end
