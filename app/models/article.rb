class Article
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  belongs_to :users
  has_many :comments

  field :users_id, type: String
  field :title, type: String
  field :content, type: String
  field :image, type: String
  field :published_date, type: DateTime, default: -> { created_at }


  index({ id: 1 }, { unique: true, name: "id_index" })

end
