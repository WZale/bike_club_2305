require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before do
    @biker = Biker.new("Kenny", 30)
    @biker_2 = Biker.new("Athena", 15)

    @ride_1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride_2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!(terrain)" do
    it "can add new types of acceptable terrain" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end 
  end

  describe "#log_ride(ride, time)" do
    it "can log a ride and the time taken to complete the ride" do
      @biker.log_ride(@ride_1, 92.5)
      @biker.log_ride(@ride_1, 91.1)
      @biker.log_ride(@ride_2, 60.9)
      @biker.log_ride(@ride_2, 61.6)

      expected = {
                  @ride_1 => [92.5, 91.1],
                  @ride_2 => [60.9, 61.6]
                  }

      expect(@biker.rides).to eq(expected)
    end
  end

  describe "#personal_record(ride)" do
    it "can report the lowest personal time for a ride" do
      @biker.log_ride(@ride_1, 92.5)
      @biker.log_ride(@ride_1, 91.1)
      @biker.log_ride(@ride_2, 60.9)
      @biker.log_ride(@ride_2, 61.6)

      expect(@biker.personal_record(@ride_1)). to eq(91.1)
      expect(@biker.personal_record(@ride_2)). to eq(60.9)
    end
  end
end