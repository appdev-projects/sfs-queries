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


class Artist < ApplicationRecord
  def past_shows
    venue_ids = self.performances.pluck(:venue_id)
    Venue.where(id: venue_ids)
  end
  
  def performances
    Performance.where(artist_id: self.id)
  end
end
