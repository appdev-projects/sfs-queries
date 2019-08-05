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
  
  def last_decade
  end
  
  def long
    Performance.where("duration > ?", 90)
  end
  
  def short
    Performance.where("duration <= ?", 90)
  end
  
  def artist
    Artist.where(id: self.artist_id).first
  end
  
  def venue
    Venue.where(id: self.venue_id).first
  end
end
