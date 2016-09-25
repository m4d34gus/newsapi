class CommentSerializer < ActiveModel::Serializer
  attributes  :users_id, :content, :articles_id
end
