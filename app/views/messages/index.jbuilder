json.array! @messages do |message|
  json.extract! message, :id, :content, :category, :order_id, :image_url, :created_at
  json.image_thumb_url message.image.thumb.url
end
