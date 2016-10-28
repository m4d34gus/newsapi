class Subcategory
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  belongs_to :categories

  field :name, type: String
  field :categories_id, type: String
  field :created_at, type: DateTime, default: -> {created_at}


  index({ id: 1 }, { unique: true, name: "id_index" })
end
