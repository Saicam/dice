require "dice"

describe Dice do
  it { is_expected.to respond_to :roll }

  it 'gives a number between 1 and 6 when rolled' do
    expect(subject.roll).to be_between(1, 6)
  end
end
