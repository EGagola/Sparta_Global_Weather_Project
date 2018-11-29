class NumberGenerator

  def initialize
    @number = 0
  end

  def random
    rand(0..39)
  end

  def compare_two_different_numbers
    different = false
    while(different == false) do
      two_numbers = [0, 0]
      two_numbers[0] = random
      two_numbers[1] = random
      if two_numbers[0]!=two_numbers[1]
        different = true
      end
    end
    two_numbers
  end

end
