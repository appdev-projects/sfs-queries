# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  dob        :date
#  name       :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

describe Artist, "#past_shows" do
  it "returns the venues that the Artist performed at", points: 1 do
    artist = Artist.new
    artist.save

    first_venue = Venue.new
    first_venue.save

    second_venue = Venue.new
    second_venue.save

    third_venue = Venue.new
    third_venue.save

    fourth_venue = Venue.new
    fourth_venue.save

    fifth_venue = Venue.new
    fifth_venue.save

    first_performance = Performance.new
    first_performance.artist_id = artist.id
    first_performance.venue_id = first_Venue.id
    first_performance.save

    second_performance = Performance.new
    second_performance.artist_id = artist.id
    second_performance.venue_id = third_Venue.id
    second_performance.save

    third_performance = Performance.new
    third_performance.artist_id = artist.id
    third_performance.venue_id = fifth_Venue.id
    third_performance.save

    expect(Artist.past_shows).to match_array([first_venue, third_venue, fifth_venue])
  end
end
