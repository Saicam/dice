require "dice"

describe Dice do
  it { is_expected.to respond_to :roll }

  it 'gives a number between 1 and 6 when rolled' do
    expect(subject.roll).to all( be_between(1, 6) )
  end

  it { is_expected.to respond_to(:roll).with(1).argument }

  it "give the right number of results" do
    expect(subject.roll(7).size).to eq 7
  end

  it "give all the results between 1 and 6" do
    expect(subject.roll(10)).to all( be_between(1,6) )
  end

end
