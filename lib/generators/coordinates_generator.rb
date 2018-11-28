class CoordsGenerator

  def generate_coords
    long = rand(-90.0...90.0).round(1)
    lat = rand(-180.0...180.0).round(1)
  end
end
