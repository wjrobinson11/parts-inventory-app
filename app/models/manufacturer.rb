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

  def self.search(search)
    if search
      where('lower(name) LIKE ?', "%#{search.downcase}%").order('name ASC')
    else
      order('name ASC')
    end
  end
end
