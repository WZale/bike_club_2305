require './lib/ride'

RSpec.describe Ride do
  before do
    @ride_1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride_2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#exists" do
    it "exists with readable attributes" do
      expect(@ride_1.name).to eq("Walnut Creek Trail")
      expect(@ride_1.distance).to eq(10.7)
      expect(@ride_1.terrain).to eq(:hills)
    end
  end

  describe "#loop?" do
    it "can report whether a ride is a loop or not" do
      expect(@ride_1.loop?).to be false
      expect(@ride_2.loop?).to be true
    end
  end

  describe "#total_distance" do
    it "can report the total distance of a ride" do
      expect(@ride_1.total_distance).to eq(21.4)
      expect(@ride_2.total_distance).to eq(14.9)
    end
  end

end