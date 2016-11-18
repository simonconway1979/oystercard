require "oystercard"

describe Oystercard do
  subject(:card){ described_class.new(journey)}
  let(:station) { double :station }
  let(:journey) { double :journey }

  before(:each) do
    allow(journey).to receive(:new)
    allow(journey).to receive(:finish)
  end


  context "Create a basic Oystercard" do

    it "should expect the balance to equal zero for a new card" do
      expect(card.balance).to eq(0)
    end

    it "should expect the balance to increase when card is topped up" do
      card.top_up(10)
      expect(card.balance).to eq 10
    end

    it "should raise an error when a top up takes the balance over 90" do
      card.top_up(described_class::MAXIMUM_BALANCE)
      expect { card.top_up(1) }.to raise_error("Top up too much. Maximum balance is £#{described_class::MAXIMUM_BALANCE}. Current balance is £#{card.balance}")
    end


    it "should expect the balance to decrease when a fare is charged" do
      allow(journey).to receive(:new)
      allow(journey).to receive(:finish)
      card.top_up(20)
      card.touch_in(station)
      expect{card.touch_out(station)}.to change{card.balance}.by(-1)
    end

  end

  context "Add touch-in touch-out functionality" do

    it "should respond to 'touch_in'" do
      expect(card).to respond_to(:touch_in)
    end

    it "should respond to 'touch out'" do
      expect(card).to respond_to(:touch_out)
    end

    it "on touch in it should report an error
    when the balance is below the minimum amount" do
    expect{ card.touch_in(station) }.to raise_error("You do not have sufficient funds. Please top up your card.")
    end

  end

  context "Add touch-in touch-out functionality (with set up)" do

    before(:each) do
      card.top_up(10)
      card.touch_in(station)
    end

    it "on touch out it should charge the card the minimum fare" do
      expect{card.touch_out(station)}.to change{card.balance}.by(-1)
    end

  end

end
