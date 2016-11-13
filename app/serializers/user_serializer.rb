class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :role, :name, :status, :slug
end
