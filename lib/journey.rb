require_relative 'oystercard'

class Journey

attr_reader :entry_station, :exit_station

PENALTY_FARE = 6
BASE_FARE = 1

  def start(station)
    @entry_station = station
  end


  def end(station)
    @exit_station = station
  end

  def fare
    !(@entry_station && @exit_station) ? PENALTY_FARE : BASE_FARE
  end

  def incomplete_journey
    !(@entry_station && @exit_station)
  end 

end