# == Schema Information
#
# Table name: leads
#
#  comments   :text
#  company    :string
#  created_at :datetime         not null
#  email      :string
#  id         :integer          not null, primary key
#  name       :string
#  origin     :string
#  part_id    :integer
#  phone      :string
#  quantity   :integer
#  updated_at :datetime         not null
#

require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
