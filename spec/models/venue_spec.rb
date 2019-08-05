# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string
#  size        :integer
#  description :string
#  city_id     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "rails_helper"

describe Venue, ".largest" do
  it "returns the largest venues", points: 2 do
    first_venue = Venue.new
    first_venue.size = 500
    first_venue.save

    second_venue = Venue.new
    second_venue.size = 200
    second_venue.save

    third_venue = Venue.new
    third_venue.size = 2050
    third_venue.save

    fourth_venue = Venue.new
    fourth_venue.size = 750
    fourth_venue.save

    expect(Venue.largest).to eq(second_venue)
  end
end

describe Venue, ".smallest" do
  it "returns the smallest venue", points: 3 do
    first_venue = Venue.new
    first_venue.size = 400
    first_venue.save

    second_venue = Venue.new
    second_venue.size = 200
    second_venue.save

    third_venue = Venue.new
    third_venue.size = 50
    third_venue.save

    fourth_venue = Venue.new
    fourth_venue.size = nil
    fourth_venue.save
    expect(Venue.smallest).to eq(third_venue)

  end
end

describe Venue, "#city" do
  it "returns the city of the venue", points: 3 do
    chicago = City.new
    chicago.save
    
    talia_hall = Venue.new
    talia_hall.city_id = chicago.id
    talia_hall.save

    expect(talia_hall.city).to eq(chicago)

  end
end

describe Venue, "#perfomances" do
  it "returns the perfomances that belong to the venue", points: 3 do
    venue = Venue.new
    venue.save

    other_venue = Venue.new
    other_venue.save

    first_performance = Performance.new
    first_performance.venue_id = venue.id
    first_performance.save

    second_performance = Performance.new
    second_performance.venue_id = other_venue.id
    second_performance.save

    third_performance = Performance.new
    third_performance.venue_id = venue.id
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.venue_id = other_venue.id
    fourth_performance.save

    fifth_performance = Performance.new
    fifth_performance.venue_id = venue.id
    fifth_performance.save

    expect(venue.perfomances).to match_array([first_performance, third_performance, fifth_performance])
  end
end
  
  describe Venue, "#artists" do
  it "returns the artists that have performed at the venue", points: 3 do
    hideout = Venue.new
    hideout.save

    little_dragon = Artist.new
    little_dragon.save
    
    mitski = Artist.new
    mitski.save
    
    chance_the_rapper = Artist.new
    chance_the_rapper.save
    
    talia_hall = Venue.new
    talia_hall.save

    first_performance = Performance.new
    first_performance.venue_id = hideout.id
    first_performance.artist_id = little_dragon.id
    first_performance.save

    second_performance = Performance.new
    second_performance.venue_id = talia_hall.id
    second_performance.artist_id = mitski.id
    second_performance.save

    third_performance = Performance.new
    third_performance.venue_id = hideout.id
    third_performance.artist_id = mitski.id
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.venue_id = talia_hall.id
    fourth_performance.artist_id = mitski.id
    fourth_performance.save

    fifth_performance = Performance.new
    fifth_performance.venue_id = hideout.id
    fifth_performance.artist_id = chance_the_rapper
    fifth_performance.save

    expect(hideout.perfomances).to match_array([little_dragon, mitski, chance_the_rapper])
  end
end
