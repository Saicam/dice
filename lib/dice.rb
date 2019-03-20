class Dice

  def self.roll(number_of_dices = 1)
    results = []
    number_of_dices.times { results << dice_roll }
    return results
  end

  private

  def self.dice_roll
    rand(6) + 1
  end
end
