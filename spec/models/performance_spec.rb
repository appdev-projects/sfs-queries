# == Schema Information
#
# Table name: performances
#
#  id           :integer          not null, primary key
#  artist_id    :integer
#  venue_id     :integer
#  show_type    :string
#  sold_out     :boolean
#  date         :datetime
#  ticket_price :decimal(, )
#  duration     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "rails_helper"

describe Performance, ".last_decade" do
  it "returns the performances from within the last 10 dates", points: 3 do
    first_performance = Performance.new
    first_performance.date = 2019
    first_performance.save

    second_performance = Performance.new
    second_performance.date = 2007
    second_performance.save

    third_performance = Performance.new
    third_performance.date = 2014
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.date = 1994
    fourth_performance.save

    expect(Performance.last_decade).to match_array([first_performance, third_performance])
  end
end

describe Performance, ".short" do
  it "returns artists whose performance durations are less than 90 minutes", points: 2 do
    first_performance = Performance.new
    first_performance.duration = 95
    first_performance.save

    second_performance = Performance.new
    second_performance.duration = 85
    second_performance.save

    third_performance = Performance.new
    third_performance.duration = 185
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.duration = 175
    fourth_performance.save

    expect(Performance.short).to match_array([second_performance])
  end
end

describe Performance, ".long" do
  it "returns artists whose performance durations are greater than 180 minutes", points: 2 do
    first_performance = Performance.new
    first_performance.duration = 95
    first_performance.save

    second_performance = Performance.new
    second_performance.duration = 85
    second_performance.save

    third_performance = Performance.new
    third_performance.duration = 185
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.duration = 175
    fourth_performance.save

    expect(Performance.long).to match_array([third_performance])
  end
end

describe Performance, "#artist" do
  it "returns the artist of the performance", points: 3 do
    artist = Artist.new
    artist.save

    performance = Performance.new
    performance.artist_id = artist.id
    performance.save

    expect(performance.artist).to eq(artist)
  end
end

describe Performance, "#venue" do
  it "returns the venue that belong to the performance", points: 3 do
    performance = Performance.new
    performance.save

    other_performance = Performance.new
    other_performance.save

    first_venue = Venue.new
    first_venue.performance_id = performance.id
    first_venue.save

    second_venue = Venue.new
    second_venue.performance_id = other_performance.id
    second_venue.save

    third_venue = Venue.new
    third_venue.performance_id = performance.id
    third_venue.save

    fourth_venue = Venue.new
    fourth_venue.performance_id = other_performance.id
    fourth_venue.save

    fifth_venue = Venue.new
    fifth_venue.performance_id = performance.id
    fifth_venue.save

    expect(performance.venue).to match_array([first_venue, third_venue, fifth_venue])
  end
end

describe Performance, "#cast" do
  it "returns the actors that appeared in the performance", points: 1 do
    performance = Performance.new
    performance.save

    first_actor = Actor.new
    first_actor.save

    second_actor = Actor.new
    second_actor.save

    third_actor = Actor.new
    third_actor.save

    fourth_actor = Actor.new
    fourth_actor.save

    fifth_actor = Actor.new
    fifth_actor.save

    first_venue = Venue.new
    first_venue.performance_id = performance.id
    first_venue.actor_id = first_actor.id
    first_venue.save

    second_venue = Venue.new
    second_venue.performance_id = performance.id
    second_venue.actor_id = third_actor.id
    second_venue.save

    third_venue = Venue.new
    third_venue.performance_id = performance.id
    third_venue.actor_id = fifth_actor.id
    third_venue.save

    expect(performance.cast).to match_array([first_actor, third_actor, fifth_actor])
  end
end
