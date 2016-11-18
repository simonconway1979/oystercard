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
      expect(journey).to respond_to (:finish)
    end

    it "should have an exit station after touch out" do
      journey.finish("Bank")
      expect(journey.exit_station).to eq("Bank")
    end

    it "should not be in a journey after touching out" do
      journey.finish("Bank")
      expect(journey.in_journey?).to be false
    end
  end

  context "Journey reporting whether it is completed" do

    it "should respond to completed?" do
      expect(journey).to respond_to(:completed?)
    end

    it "should report that a journey is completed if it is completed" do
      journey.finish("Bank")
      expect(journey.completed?).to eq(true)
    end


  end

  context "moving exit station into journey class" do

    it "should respond to touch in with 1 argument" do
      expect(journey).to respond_to(:finish).with(1).argument
    end
  end

  context "fare method" do

    it "should respond to fare" do
      expect(journey).to respond_to(:fare)
    end

    it "should return penalty fare if no entry station on touch out" do
      journey2 = Journey.new(nil)
      journey2.finish("Hammersmith")
      expect(journey2.fare).to eq Journey::PENALTY_FARE
    end

    it "should return minimmum fare" do
      journey.finish("Bank")
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end

  context "Moving record_entry and record_exit over to Journey class" do

    it "should repsond to record_entry" do
      expect(journey).to respond_to(:record_entry)
    end

    it "should respond to record_exit"  do
      expect(journey).to respond_to(:record_exit)
    end

  end

  context "recording the journeys (with set up)" do

    before(:each) do

    end

    it "should be able to see an updated journey history when we touch in" do
      expect(journey.record_entry).to eq ({"entry"=>"Hammersmith"})
    end

    it " should be able to see the updated journey history when we touch out" do
      expect(journey.finish(:station)).to eq ({"entry"=>"Hammersmith", "exit"=>:station})
    end
  end
end
