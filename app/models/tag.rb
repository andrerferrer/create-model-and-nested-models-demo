class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :restaurant_tags, dependent: :destroy
  has_many :restaurants, through: :restaurant_tags
end
