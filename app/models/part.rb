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


  def self.search(search)
    if search
      where('lower(part_number) LIKE ? OR lower(part_type) LIKE ? OR lower(description) like ? OR lower(manufacturer) like ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%").order('part_number ASC')
    else
      order('part_number ASC')
    end
  end
end
