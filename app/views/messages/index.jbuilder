json.array! @messages do |message|
  json.extract! message, :id, :content, :category, :order_id, :created_at
end
