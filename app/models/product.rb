class Product < ApplicationRecord
  belongs_to :store, optional: true;

  mount_uploader :image, ImageUploader
end
