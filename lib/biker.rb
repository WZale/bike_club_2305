class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain
  
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    ride_times = []
    if !@acceptable_terrain.include?(ride.terrain) || ride.distance > @max_distance
      false
    elsif @rides[ride] == nil
      @rides[ride] = (ride_times << time)
    else
      ride_times << time
      @rides[ride] += ride_times
    end
  end
  
  def personal_record(ride)
    if @rides.include?(ride)
      times = []
      @rides[ride].each do |time|
        times << time
      end
      times.min
    else
      false
    end
  end
  
end