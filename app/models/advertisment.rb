class Advertisment
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :users
  field :users_id, type: String
  field :title, type: String
  field :content, type: String
  field :published_date, type: DateTime

  index({ id: 1 }, { unique: true, name: "id_index" })

 
end
