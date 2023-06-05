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
    if @rides[ride] == nil
      @rides[ride] = (ride_times << time)
    else
      ride_times << time
      @rides[ride] += ride_times
    end
  end

#   Bikers can log a ride with a time. The Biker can keep track of all of its previous rides and times for those rides.

# A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. They also won't log a ride if the ride's total distance is greater than the Biker's max distance.

# A Biker can report its personal record for a specific ride. This is the lowest time recorded for a ride. This method will return false if the Biker hasn't completed the ride
end