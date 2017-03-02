class CreateParts < ActiveRecord::Migration[5.0]
  def change
    enable_extension "hstore"
    create_table :parts do |t|
      t.string :part_number
      t.string :manufacturer
      t.text :description
      t.string :quantity_in_stock
      t.string :image_url
      t.hstore :specs
      t.string :part_type

      t.timestamps
    end

    add_index :parts, :part_number
    add_index :parts, :manufacturer
  end
end
