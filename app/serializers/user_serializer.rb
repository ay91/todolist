class UserSerializer < ActiveModel::Serializer
  attributes :username
  attributes :email
  attributes :password
end
