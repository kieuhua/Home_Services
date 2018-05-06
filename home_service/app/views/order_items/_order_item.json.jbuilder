json.extract! order_item, :id, :unit_price, :quantity, :total_price, :client_id, :service_id, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
