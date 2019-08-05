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
end
