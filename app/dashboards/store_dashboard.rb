require "administrate/base_dashboard"

class StoreDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    reviews: Field::HasMany,
    products: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    country: Field::String,
    area_code: Field::String,
    phone_1: Field::String,
    phone_2: Field::String,
    description: Field::Text,
    image: Field::String,
    mon_open: Field::Time,
    mon_end: Field::Time,
    mon_closed: Field::Boolean,
    tues_open: Field::Time,
    tues_end: Field::Time,
    tues_closed: Field::Boolean,
    wed_open: Field::Time,
    wed_end: Field::Time,
    wed_closed: Field::Boolean,
    thurs_open: Field::Time,
    thurs_end: Field::Time,
    thurs_closed: Field::Boolean,
    fri_open: Field::Time,
    fri_end: Field::Time,
    fri_closed: Field::Boolean,
    sat_open: Field::Time,
    sat_end: Field::Time,
    sat_closed: Field::Boolean,
    sun_open: Field::Time,
    sun_end: Field::Time,
    sun_closed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :reviews,
    :products,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :reviews,
    :products,
    :id,
    :name,
    :address,
    :city,
    :state,
    :zip,
    :country,
    :area_code,
    :phone_1,
    :phone_2,
    :description,
    :image,
    :mon_open,
    :mon_end,
    :mon_closed,
    :tues_open,
    :tues_end,
    :tues_closed,
    :wed_open,
    :wed_end,
    :wed_closed,
    :thurs_open,
    :thurs_end,
    :thurs_closed,
    :fri_open,
    :fri_end,
    :fri_closed,
    :sat_open,
    :sat_end,
    :sat_closed,
    :sun_open,
    :sun_end,
    :sun_closed,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :reviews,
    :products,
    :name,
    :address,
    :city,
    :state,
    :zip,
    :country,
    :area_code,
    :phone_1,
    :phone_2,
    :description,
    :image,
    :mon_open,
    :mon_end,
    :mon_closed,
    :tues_open,
    :tues_end,
    :tues_closed,
    :wed_open,
    :wed_end,
    :wed_closed,
    :thurs_open,
    :thurs_end,
    :thurs_closed,
    :fri_open,
    :fri_end,
    :fri_closed,
    :sat_open,
    :sat_end,
    :sat_closed,
    :sun_open,
    :sun_end,
    :sun_closed,
  ].freeze

  # Overwrite this method to customize how stores are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(store)
  #   "Store ##{store.id}"
  # end
end
