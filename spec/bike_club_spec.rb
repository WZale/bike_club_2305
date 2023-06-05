require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before do
    @club_1 = BikeClub.new("Hells Angels")

    @biker = Biker.new("Kenny", 30)
    @biker_2 = Biker.new("Athena", 15)

    @ride_1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride_2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@club_1.name).to eq("Hells Angels")
      expect(@club_1.bikers).to eq([])
    end
  end
  
  describe "#add_biker" do
    it "can add bikers to the club" do
      @club_1.add_biker(@biker)
      @club_1.add_biker(@biker_2)
      expect(@club_1.bikers).to eq([@biker, @biker_2])
    end
  end

  describe "#most_rides" do
    it "can report which biker has logged the most rides" do
      @club_1.add_biker(@biker)
      @club_1.add_biker(@biker_2)

      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride_1, 92.5)
      @biker.log_ride(@ride_1, 91.1)
      @biker.log_ride(@ride_2, 60.9)
      @biker.log_ride(@ride_2, 61.6)

      @biker_2.learn_terrain!(:gravel)
      
      @biker_2.log_ride(@ride_1, 95.0)
      @biker_2.log_ride(@ride_2, 65.0)

      expect(@club_1.most_rides).to eq("Kenny")
    end
  end
end