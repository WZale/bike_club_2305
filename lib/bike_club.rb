class BikeClub
  attr_reader :name,
              :bikers,
              :rides

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  # from Dani
  def most_rides
    @bikers.max_by do |biker|
      biker.rides.sum do |ride, times|
        times.count 
      end
    end
  end

  # I think this one doesn't quite work because @rider_2 can't ride
  # the terrain of @ride_1, or something? Not sure.
  def best_time(ride)
    a = @bikers.select do |biker|
      require 'pry'; binding.pry
      biker.rides[ride].min
    end
    a
  end


  # My version, which only returns the biker's name and not
  # the actual biker object

  # def most_rides
  #   rides = {}
  #   @bikers.each do |biker| 
  #     rides[biker.name] = biker.rides.values.flatten
  #   end
  #   max_rider = rides.max_by do |biker, rides|
  #     biker
  #   end
  #   max_rider[0]
  # end

end