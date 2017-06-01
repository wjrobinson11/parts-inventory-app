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

class Lead < ApplicationRecord
  belongs_to :part
  validate :contact_is_present?

  protected

  def contact_is_present?
    if email.blank? && phone.blank?
      errors.add :error, "Phone number or email must be present."
    end
  end
end
