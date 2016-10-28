class SubcategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :categories_id
end
