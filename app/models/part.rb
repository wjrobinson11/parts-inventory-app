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

  default_scope -> {where('id <= ?', 20214)}

  def self.search(search)
    if search
      _search = search.gsub(/[^a-z0-9\s]/i, ' ')
      where("lower(replace(part_number, '-', '')) LIKE ? OR lower(part_number) LIKE ? OR lower(part_type) like ? OR lower(manufacturer) like ? OR lower(part_number) LIKE ? OR lower(part_type) like ? OR lower(manufacturer) like ?", "%#{_search.downcase}%", "%#{_search.downcase}%", "%#{_search.downcase}%", "%#{_search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%").order('part_number ASC')
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

