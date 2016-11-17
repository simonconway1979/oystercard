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

    it "journey should initialize with an entry station" do
      expect(journey.entry_station).not_to be(nil)
    end

    it "should be in a journey after touching in" do
      expect(journey.in_journey?).to be true
    end

    it "should be able to touch out" do
      expect(journey).to respond_to (:touch_out)
    end

    it "should have an exit station after touch out" do
      journey.touch_out("Bank")
      expect(journey.exit_station).to eq("Bank")
    end

    it "should not be in a journey after touching out" do
      journey.touch_out("Bank")
      expect(journey.in_journey?).to be false
    end
  end

  context "moving touch in method into Journey" do

    it "should respond to touch_in" do
      expect(journey).to respond_to(:touch_in)
    end

    it "should create a new journey on touch in" do
      expect(journey.touch_in).to be_a(Journey)
    end

  end

  context "moving exit station into journey class" do

    it "should respond to touch in with 1 argument" do
      expect(journey).to respond_to(:touch_out).with(1).argument
    end
  end

  context "fare method" do

    it "should respond to fare" do
      expect(journey).to respond_to(:fare)
    end

    #it "should return minimum fare" do
    #  expect(journey.fare).to eq Journey::MINIMUM_FARE
    #end

    #it "should return penalty fare if no entry station on touch out" do
    #  expect(journey.touch_out("Bank")).to eq Journey::PENALTY_FARE
    #end
  end
end
