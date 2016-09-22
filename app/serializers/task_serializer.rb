class TaskSerializer < ActiveModel::Serializer
  attributes :created_at, :body, :user_id, :completed
end
