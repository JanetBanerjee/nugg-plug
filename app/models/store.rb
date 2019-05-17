class Store < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :products

  mount_uploader :image, ImageUploader
end
