
class NumberGenerator

  def random
    (rand * 40).floor
  end

  def generate_two_different_numbers
    different = false
    two_numbers = [random, 0]
    while(different == false) do
      two_numbers[1] = random
      if (two_numbers[0] != two_numbers[1])
        different = true
      end
    end
    return two_numbers
  end

end
