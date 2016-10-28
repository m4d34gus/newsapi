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
  field :categories_id, type: String
  field :subcategories_id, type: String
  field :published_date, type: DateTime, default: -> { created_at }
  field :created_at, type: DateTime, default: -> { created_at }
  field :edited_at, type: DateTime


  index({ id: 1 }, { unique: true, name: "id_index" })



end
