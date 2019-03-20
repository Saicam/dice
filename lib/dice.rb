class Dice

  def roll(number_of_dices = 1)
    results = []
    number_of_dices.times { results << rand(6) + 1 }
    return results
  end
end
