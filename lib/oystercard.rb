require_relative "journey.rb"

class Oystercard

attr_reader :balance, :entry_station, :journey

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

def initialize(journey_klass)
  @balance = 0
  @entry_station
  @journey = journey_klass
end

def top_up(amount)
  fail "Top up too much. Maximum balance is £#{MAXIMUM_BALANCE}. Current balance is £#{@balance}" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount
end

def touch_in(entry_station)
  fail "You do not have sufficient funds. Please top up your card." if @balance < MINIMUM_BALANCE
  @journey.new(entry_station)
end

def touch_out(station)
  @journey.finish(station)
  deduct
end

private

def deduct
  @balance -= MINIMUM_BALANCE
end




end
