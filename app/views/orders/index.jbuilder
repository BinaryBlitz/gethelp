json.array! @orders do |order|
  json.extract! order,
                :id, :course, :grade, :category, :university, :faculty, :email,
                :starts_at, :due_by, :description, :created_at
end
