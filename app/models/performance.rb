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
end
