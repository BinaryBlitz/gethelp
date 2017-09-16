json.array! @posts do |post|
  json.extract! post, :id, :title, :subtitle, :content, :image_url, :promo, :created_at
end
