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


class Venue < ApplicationRecord
  
  def city
    City.where(id: self.city_id).first
  end
  
  def performances
    Performance.where(venue_id: self.id)
  end
  
  def artists
    artist_ids = self.performances.pluck(:artist_id)
    Artist.where(id: artist_ids)
  end
  
  def Venue.smallest
    Venue.where.not(size: nil).order(:size).first
  end
  
  def Venue.largest
    Venue.all.order(:size).last
  end
  
end
