class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :auth_token
end
