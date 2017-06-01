class AddFeaturesToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :features, :text
  end
end
