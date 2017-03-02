json.extract! part, :id, :description, :image_url, :manufacturer, :part_number, :part_type, :quantity_in_stock, :specs, :created_at, :updated_at
json.url part_url(part, format: :json)
