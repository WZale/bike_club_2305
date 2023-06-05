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

  def most_rides
    rides = {}
    @bikers.each do |biker| 
      rides[biker.name] = biker.rides.values.flatten
    end
    max_rider = rides.max_by do |biker, rides|
      biker
    end
    max_rider[0]
  end

end