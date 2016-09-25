class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :password, :password_confirmation

end
