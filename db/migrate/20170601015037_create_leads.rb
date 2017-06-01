class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :phone
      t.integer :part_id
      t.integer :quantity
      t.string :origin
      t.text :comments

      t.timestamps
    end
  end
end
