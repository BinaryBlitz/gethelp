json.array! @orders do |order|
  json.extract! order,
                :id, :course, :grade, :category, :university, :faculty,
                :email, :status, :sum, :starts_at, :due_by, :description,
                :viewed?, :activity_type, :created_at
end
