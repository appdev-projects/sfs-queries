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


class Performance < ApplicationRecord
  
  def Performance.last_decade
    Performance.where("date > ?", 10.years.ago)
  end
  
  def Performance.long
    Performance.where("duration > ?", 180)
  end
  
  def Performance.short
    Performance.where("duration <= ?", 90)
  end
  
  def artist
    Artist.where(id: self.artist_id).first
  end
  
  def venue
    Venue.where(id: self.venue_id).first
  end
end
