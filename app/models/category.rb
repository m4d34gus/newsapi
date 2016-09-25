class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  belongs_to :users
  
  field :name, type: String
  field :users_id, type: String

  index({ id: 1 }, { unique: true, name: "id_index" })
end
