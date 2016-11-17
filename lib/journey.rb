class Journey

  attr_reader :entry_station

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def in_journey?
    !!@entry_station
  end

  def touch_out
    @entry_station = nil
  end

end
