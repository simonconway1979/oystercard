class Journey

  attr_reader :entry_station, :exit_station

    MINIMUM_FARE = 1
    PENALTY_FARE = 6

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
  end

  def in_journey?
    !@exit_station
  end


  def touch_out(exit_station)
    @exit_station = exit_station
  end


  def fare
    MINIMUM_FARE
  end

end
