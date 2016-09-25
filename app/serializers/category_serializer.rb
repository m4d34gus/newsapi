class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :lastedited, :created, :users_id
end
