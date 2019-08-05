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
end
