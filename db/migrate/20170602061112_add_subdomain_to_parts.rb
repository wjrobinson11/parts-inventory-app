class AddSubdomainToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :subdomain, :string
    add_column :parts, :backup_image_url, :string
    add_index :parts, :subdomain
    add_index :parts, :part_type
    add_index :parts, :description
  end
end
