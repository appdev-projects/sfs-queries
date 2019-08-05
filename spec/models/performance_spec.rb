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
    first_performance.date = 11.years.ago
    first_performance.save

    second_performance = Performance.new
    second_performance.date = 2.years.ago
    second_performance.save

    third_performance = Performance.new
    third_performance.date = 13.years.ago
    third_performance.save

    fourth_performance = Performance.new
    fourth_performance.date = 1.week.ago
    fourth_performance.save

    expect(Performance.last_decade).to match_array([second_performance, fourth_performance])
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
    
    first_venue = Venue.new
    first_venue.save
    
    performance = Performance.new
    performance.venue_id = first_venue.id
    performance.save
    
    expect(performance.venue).to eq(first_venue)
  end
end
