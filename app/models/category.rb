class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include Mongoid::Slug

  has_many :subcategories
  
  field :name, type: String
  slug :name
  field :created_at, type: DateTime, default: -> {created_at}

  index({ id: 1 }, { unique: true, name: "id_index" })

  def idstring
    id.to_s
  end

end
