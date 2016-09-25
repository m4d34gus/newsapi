class AdvertismentSerializer < ActiveModel::Serializer
  attributes :id, :users_id, :name, :content, :published_date
end
