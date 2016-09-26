class TaskSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :body, :user_id, :completed
end
