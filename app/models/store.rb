class Store < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :products

  mount_uploader :image, ImageUploader

  def full_address
    [:address, :city, :state, :country].compact.join(', ')
  end

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
