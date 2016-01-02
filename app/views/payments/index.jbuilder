json.array! @payments do |payment|
  json.extract! payment, :id, :sum, :paid, :created_at
end
