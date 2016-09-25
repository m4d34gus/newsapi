class Comment
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :articles
  belongs_to :users

  field :users_id, type: String
  field :content, type: String
  field :articles_id, type: String

  index({ id: 1 }, { unique: true, name: "id_index" })
  index({ articles_id: 1 }, {  name: "articles_index" })

  
end
