require 'journey.rb'

describe Journey do

  let (:journey) { described_class.new("Hammersmith") }

  it "should be a Journey object" do
    expect(journey).to be_a(Journey)
  end

  it "should return the entry station of the journey" do
    expect(journey.entry_station).to eq "Hammersmith"
  end

  context "moving in_journey? method across from oystercard" do

    it "should respond to 'in_journey'" do
      expect(journey).to respond_to(:in_journey?)
    end

    # it "journey should initialize with an entry station" do
    #   expect(subject.entry_station).to not_be nil
    # end

    # it "should be in a journey after touching in" do
    #   allow(:card).to receive(:touch_in).and_return(:Hammersmith)
    #   expect(subject.in_journey?).to be true
    # end

    # it "should not be in a journey after touching out" do
    #   subject.touch_out(station)
    #   expect(subject.in_journey?).to be false
    # end

  end
end
