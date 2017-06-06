# == Schema Information
#
# Table name: parts
#
#  created_at        :datetime         not null
#  description       :text
#  features          :text
#  id                :integer          not null, primary key
#  image_url         :string
#  manufacturer      :string
#  part_number       :string
#  part_type         :string
#  pdf_url           :string
#  quantity_in_stock :string
#  specs             :hstore
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_parts_on_manufacturer  (manufacturer)
#  index_parts_on_part_number   (part_number)
#

class Part < ApplicationRecord
  validates :part_number, uniqueness: true, presence: true
  validates :manufacturer, presence: true
  validates :description, presence: true

  before_save :set_subdomain
  before_save :set_image_url


  def self.search(search)
    if search
      where('lower(part_number) LIKE ? OR lower(part_type) like ? OR lower(manufacturer) like ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%").order('part_number ASC')
    else
      order('part_number ASC')
    end
  end

  def set_subdomain
    self.subdomain = part_number.gsub(/[^0-9a-z-]/i, '').downcase
  end

  def set_image_url
    self.image_url ||= 'http://res.cloudinary.com/duzt9avdv/image/upload/v1496386503/vtfommkbh8hwyaf0rnp0.png'
  end
end

