class Len
  include Mongoid::Document
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  include Mongoid::Slug
  include Mongoid::Paperclip

  belongs_to :users

  field :title, type: String
  has_mongoid_attached_file :image,
                            :path=>":rails_root/public:url",
                            :url=> "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
                            :hash_secret=> Rails.application.secrets.secret_key_base,
                            :styles => { :thumb => "100x100#",
                                         :small  => "150x150>",
                                         :medium => "500x500>" }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
  field :caption, type: String
  field :users_id, type: String
  slug :title


  index({ id: 1 }, { unique: true, name: "id_index" })

  def image_thumb
    image.url(:thumb)
  end

  def image_small
    image.url(:small)
  end

  def image_medium
    image.url(:medium)
  end

  def as_json(*args)
    res = super
    res["id"] = res.delete("_id").to_s
    res
  end
end
