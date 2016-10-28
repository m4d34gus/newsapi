class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :image, :published_date, :categories_id
end
