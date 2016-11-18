class Journey

  attr_reader :entry_station, :exit_station, :history, :counter

    MINIMUM_FARE = 1
    PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
    @history = {}
    @counter = 1
    record_entry
  end

  def in_journey?
    !@exit_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    record_exit
  end

  def completed?
    !!@exit_station && !!@entry_station
  end

  def fare
    return PENALTY_FARE if completed? == false
    MINIMUM_FARE
  end

  def record_entry
    @history["journey_#{@counter}"] = { "entry" => @entry_station}
  end

  def record_exit
    @history["journey_#{@counter}"].merge!({ "exit" => @exit_station})
    @counter += 1
    @history["journey_#{@counter-1}"]
  end

end
