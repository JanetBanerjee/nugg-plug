class Review < ApplicationRecord
  belongs_to :store, optional: true;
  belongs_to :user, optional: true;


end
