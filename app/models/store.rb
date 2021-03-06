class Store < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :products

  mount_uploader :image, ImageUploader
  mount_uploader :thumb, ThumbUploader

  def full_address
    [:address, :city, :state, :country].compact.join(', ')
  end

  geocoded_by :full_address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def self.search(search)
    if search
      self.where('name LIKE ?', "%#{search}%")
    else
      self.all
    end
  end

end
