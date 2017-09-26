json.array! @orders do |order|
  json.extract! order,
                :id, :course, :grade, :category, :university, :faculty,
                :email, :status, :sum, :starts_at, :due_by, :description,
                :activity_type, :created_at,
                :messages_read, :last_message_created_at
end
