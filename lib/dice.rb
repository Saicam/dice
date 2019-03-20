class Dice

  def roll(number_of_dices = 1)
    number_of_dices.times { rand(6) + 1}
  end
end
