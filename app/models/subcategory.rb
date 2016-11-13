class Subcategory
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include Mongoid::Slug
  belongs_to :categories

  field :name, type: String
  field :categories_id, type: String
  field :created_at, type: DateTime, default: -> {created_at}
  slug :name


  index({ id: 1 }, { unique: true, name: "id_index" })

  def idstring
    id.to_s
  end
end
