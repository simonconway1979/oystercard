class Oystercard

attr_reader :balance, :entry_station, :journey_history

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

def initialize
  @balance = 0
  @entry_station
  @journey_history = Hash.new
  @journey_counter = 1
end

def top_up(amount)
  fail "Top up too much. Maximum balance is £90. Current balance is #{@balance}" if @balance + amount > MAXIMUM_BALANCE
  @balance += amount
end

def touch_in(station)
  if @balance < MINIMUM_BALANCE
    fail("You do not have sufficient funds. Please top up your card.")
  else
    @entry_station = station
    record_entry(station)
  end
end

def touch_out(station)
  record_exit(station)
  @entry_station = nil
  deduct
end

def record_entry(station)
  @journey_history["journey_#{@journey_counter}"] = { "entry" => station}
end

def record_exit(station)
  @journey_history["journey_#{@journey_counter}"].merge!({ "exit" => station})
  @journey_counter += 1
end

private

def deduct
  @balance -= MINIMUM_BALANCE
end




end
