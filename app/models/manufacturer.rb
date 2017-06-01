# == Schema Information
#
# Table name: manufacturers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  image_url  :string
#  name       :string
#  updated_at :datetime         not null
#

class Manufacturer < ApplicationRecord
  has_many :parts

  validates :name, uniqueness: true
end
