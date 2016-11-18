require "journey_log"

describe JourneyLog do

  subject(:journey_log) { described_class.new(current_journey) }
  let(:start_station) {double :station}
  let(:end_station) {double :station}
  let(:current_journey) {double :journey}

  before(:each) do
    allow(current_journey).to receive(:new).with(start_station)
    allow(current_journey).to receive(:finish).with(end_station)
  end

  context "Starting and ending a journey" do

    it "should start a journey" do
      expect(journey_log).to respond_to(:start).with(1).argument
    end

    it "should end a journey" do
      expect(journey_log).to respond_to(:end).with(1).argument
    end

    it "should be able to see an updated journey history when we touch in" do
      expect(journey_log.start(start_station)).to eq ({"entry" => start_station})
    end

    it " should be able to see the updated journey history when we touch out" do
      journey_log.start(start_station)
      expect(journey_log.end(end_station)).to eq ({"entry" => start_station, "exit" => end_station})
    end

  end
end
