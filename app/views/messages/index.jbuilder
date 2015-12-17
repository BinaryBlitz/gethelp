json.array! @messages do |message|
  json.extract! message, :id, :content, :category, :order_id, :image_url, :created_at
end
