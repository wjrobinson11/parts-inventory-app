# == Schema Information
#
# Table name: parts
#
#  created_at        :datetime         not null
#  description       :text
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

require 'test_helper'

class PartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
