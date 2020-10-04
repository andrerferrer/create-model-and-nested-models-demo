class Restaurant < ApplicationRecord
  
  STRONG_PARAMS = [
    :name,
    :address,
    tag_ids: []
  ]
  
  has_many :reviews, dependent: :destroy
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags
  accepts_nested_attributes_for :tags

end
