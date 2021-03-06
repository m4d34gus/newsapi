class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Slug

  has_secure_password

  has_many :advertisments
  has_many :articles
  has_many :comments
  has_many :lens

  field :email, type: String
  field :password_digest, type: String
  field :role, type: String, default: 'guests'
  field :name, type: String
  field :status, type: String
  slug :name

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :provider, 			 type: String
  field :uid,				 type: String
  field :name,				 type: String
  field :oauth_token,		 type: String
  field :oauth_expired_at,	 type: DateTime
  field	:auth_token,		 type: String

  
end
