class AddPdfUrlToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :pdf_url, :string
  end
end
