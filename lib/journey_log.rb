class JourneyLog


attr_reader :history, :counter, :current_journey

def initialize(journey_klass)
  @log = {}
  @counter = 1
  @current_journey = journey_klass
end

def start(entry_station)
  @current_journey.new(entry_station)
  @log["journey_#{@counter}"] = { "entry" => entry_station}
end

def end(exit_station)
  @current_journey.finish(exit_station)
  @log["journey_#{@counter}"].merge!({ "exit" => exit_station})
  @counter += 1
  @log["journey_#{@counter-1}"]
end

end
