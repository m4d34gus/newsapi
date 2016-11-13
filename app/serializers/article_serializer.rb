class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :categories_id, :subcategories_id, :published, :slug
end
